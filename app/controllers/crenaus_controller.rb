class CrenausController < ApplicationController
  before_action :set_crenau, only: [:show, :edit, :update, :destroy]
  before_action :set_adherent, only: [:new, :edit, :update, :create, :destroy]
  # GET /crenaus
  # GET /crenaus.json
  def index
    @crenaus = Crenau.all
  end

  # GET /crenaus/1
  # GET /crenaus/1.json
  def show
  end

  # GET /crenaus/new
  def new
    @usercollection = [@adherent]
    @path = adherent_crenaus_path
    @crenau = Crenau.new
    @crenau.start = "0:00"
    @crenau.end = "0:00"
    @crenau.user = @adherent
  end

  # GET /crenaus/1/edit
  def edit
    @path = adherent_crenau_path(@adherent, @crenau)
    @usercollection = User.joins(:function).where("functions.name = 'Professeur'").order('first_name')

  end

  # POST /crenaus
  # POST /crenaus.json
  def create
    @crenau = Crenau.new(crenau_params)
    @crenau.recurence = @recurences.find_index { |w| w == params["crenau"]["recurence"] }
    if @crenau.save
      redirect_to adherent_path(@adherent), notice: 'Creneau crée.'
    else
      render :new
    end
  end

  # PATCH/PUT /crenaus/1
  # PATCH/PUT /crenaus/1.json
  def update
    params["crenau"]["recurence"] = @recurences.find_index { |w| w == params["crenau"]["recurence"] }
    @crenau.valide = params["crenau"]["valide"] == "true"
    if @crenau.update(crenau_params)
      redirect_to adherent_path(@adherent), notice: 'Creneau sauvegardé.'
    else
      render :edit
    end
  end

  # DELETE /crenaus/1
  # DELETE /crenaus/1.json
  def destroy
    @crenau.destroy
    redirect_to adherent_path(@adherent), notice: 'Creneau effacé.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crenau
      @crenau = Crenau.find(params[:id])
    end

    def set_adherent
      @adherent = User.find(params[:adherent_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crenau_params
      params.require(:crenau).permit(:valide, :user_id, :year_id, :valide, :discipline_id, :instrument_id, :jour, :recurence, :start, :end)
    end
end
