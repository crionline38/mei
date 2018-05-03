class CrenausController < ApplicationController
  before_action :set_crenau, only: [:show, :edit, :update, :destroy]
  before_action :set_adherent, only: [:new, :edit, :index, :destroy]
  # GET /crenaus
  # GET /crenaus.json
  def index
    @colors = {}
    @instindex = {}
    color ="100F0F"
    i = 0
    Instrument.where(valide:true).each do |instrument|
      color = (color.to_i(16) + 1600000).to_s(16)
      @colors[instrument.id] = color + "7F"
      @instindex[instrument.id] = i
      i += 1
    end


    if ["Bureau", "Secrétaire", "Trésorier", "Président", "Admin"].include?(@adherent.function.name)
      @crenaus = Crenau.where(year: @saison).order(:valide)
      render :all
    else
      @crenaus = Crenau.where(user: @adherent).rewhere(year: @saison).order(:valide)
    end
  end

    # GET /crenaus/1
  # GET /crenaus/1.json
  def show
  end

  # GET /crenaus/new
  def new
    @crenau = Crenau.new
    if @adherent.function.name == "Professeur"
      @usercollection = [@adherent]
      @crenau.user = @adherent
    else
      @usercollection = User.joins(:function).where("functions.name = 'Professeur'").order('first_name')
      @crenau.user = User.joins(:function).where("functions.name = 'Professeur'").last
    end
    @crenau.start = "9:00"
    @crenau.end = "22:00"
    @instruments = Instrument.where(valide: true)
    @disciplines = []
  end

  # GET /crenaus/1/edit
  def edit
    @usercollection = User.joins(:function).where("functions.name = 'Professeur'").order('first_name')
    @instruments = Instrument.where(valide: true)
    @disciplines = Discipline.joins(:instruments).where(instruments: {id: @crenau.instrument.id})

  end

  # POST /crenaus
  # POST /crenaus.json
  def create
    @adherent = User.find(params[:user_id])

    @crenau = Crenau.new(crenau_params)
    if @adherent.function.name == "Professeur"
      @usercollection = [@adherent]
      @crenau.user = @adherent
    else
      @usercollection = User.joins(:function).where("functions.name = 'Professeur'").order('first_name')
      @crenau.user = User.joins(:function).where("functions.name = 'Professeur'").last
    end
    @crenau.recurence = @recurences.find_index { |w| w == params["crenau"]["recurence"] }
    @crenau.jour = @jours.find_index { |w| w == params["crenau"]["jour"] }
    if @crenau.save
      redirect_to adherent_crenaus_path(@adherent), notice: 'Creneau crée.'
    else
      render :new
    end
  end

  # PATCH/PUT /crenaus/1
  # PATCH/PUT /crenaus/1.json
  def update
    @adherent = User.find(params[:user_id])
    params["crenau"]["recurence"] = @recurences.find_index { |w| w == params["crenau"]["recurence"] }
    params["crenau"]["jour"] = @jours.find_index { |w| w == params["crenau"]["jour"] }
    @crenau.valide = params["crenau"]["valide"] == "true"
    if @crenau.update(crenau_params)
      redirect_to adherent_crenaus_path(@adherent), notice: 'Creneau sauvegardé.'
    else
      render :edit
    end
  end

  # DELETE /crenaus/1
  # DELETE /crenaus/1.json
  def destroy
    @crenau.destroy
    redirect_to adherent_crenaus_path(@adherent), notice: 'Creneau effacé.'
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
