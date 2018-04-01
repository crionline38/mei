class CrenausController < ApplicationController
  before_action :set_crenau, only: [:show, :edit, :update, :destroy]
  before_action :set_adherent, only: [:new, :edit, :update, :create, :destroy]
  # GET /crenaus
  # GET /crenaus.json
  def index
    if @auth
      @crenaus = Crenau.where(year: @saison).order(:valide, :jour)
    else
      @crenaus = Crenau.where(user: current_user).rewhere(year: @saison).order(:valide)
    end
    current_user.function.name == "Professeur" ? @prof = "?prof=#{current_user.id}" : @prof =""
  end

  # GET /crenaus/1
  # GET /crenaus/1.json
  def show
  end

  # GET /crenaus/new
  def new
    @usercollection = User.joins(:function).where("functions.name = 'Professeur'").order('first_name')
    @usercollection = [current_user] if current_user.function.name = "Professeur"
    @crenau = Crenau.new
    @crenau.user = current_user
    if params["prof"]
      @crenau.user = User.find(params["prof"].to_i)
      @usercollection = User.joins(:function).where("functions.name = 'Professeur'").order('first_name')
    end
    @crenau.start = "0:00"
    @crenau.end = "0:00"
  end

  # GET /crenaus/1/edit
  def edit
    @usercollection = User.joins(:function).where("functions.name = 'Professeur'").order('first_name')
  end

  # POST /crenaus
  # POST /crenaus.json
  def create
    @crenau = Crenau.new(crenau_params)
    @crenau.recurence = @recurences.find_index { |w| w == params["crenau"]["recurence"] }
    @crenau.jour = @jours.find_index { |w| w == params["crenau"]["jour"] }
    if @crenau.save
      redirect_to crenaus_path, notice: 'Creneau crée.'
    else
      render :new
    end
  end

  # PATCH/PUT /crenaus/1
  # PATCH/PUT /crenaus/1.json
  def update
    params["crenau"]["recurence"] = @recurences.find_index { |w| w == params["crenau"]["recurence"] }
    params["crenau"]["jour"] = @jours.find_index { |w| w == params["crenau"]["jour"] }
    @crenau.valide = params["crenau"]["valide"] == "true"
    if @crenau.update(crenau_params)
      redirect_to crenaus_path, notice: 'Creneau sauvegardé.'
    else
      render :edit
    end
  end

  # DELETE /crenaus/1
  # DELETE /crenaus/1.json
  def destroy
    @crenau.destroy
    redirect_to crenaus_path, notice: 'Creneau effacé.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crenau
      @crenau = Crenau.find(params[:id])
    end

    def set_adherent
      @adherent = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crenau_params
      params.require(:crenau).permit(:valide, :user_id, :year_id, :valide, :discipline_id, :instrument_id, :jour, :recurence, :start, :end)
    end
end
