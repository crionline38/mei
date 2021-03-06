class CoursController < ApplicationController
  before_action :set_cour, only: [:show, :edit, :update, :destroy]
  before_action :set_student, only: [:new, :edit, :update, :create, :destroy]

  # GET /cours
  # GET /cours.json
  def index
    @cours = Cour.all
  end

  # GET /cours/1
  # GET /cours/1.json
  def show
  end

  # GET /cours/new
  def new
    @cour = Cour.new
    @cour.plus = false
    @cour.eco = false
    @instruments = Instrument.where(valide: true)
    @disciplines = []
    @adherent = @student.user
  end

  # GET /cours/1/edit
  def edit
    @instruments = Instrument.where(valide: true)
    @disciplines = Discipline.joins(:instruments).where(instruments: {id: @cour.instrument.id})
    @crenaus = Crenau.where(instrument: @cour.instrument.id).rewhere(discipline: @cour.discipline.id).rewhere(year: @saison).rewhere(valide: true).order(:jour)

  end

  # POST /cours
  # POST /cours.json
  def create
    @cour = Cour.new(cour_params)
    @cour.plus = params['plus']
    @cour.eco = params['eco']
    @cour.comments = params["cour"]["comments"]
    @cour.dispo = params['dispo']
      if @cour.save
        redirect_to @student, notice: 'Pré inscription au cour enregistrée.'
      else
        render :new
      end
  end

  # PATCH/PUT /cours/1
  # PATCH/PUT /cours/1.json
  def update
    if @cour.update(cour_params)
      @cour.plus = params['plus']
      @cour.eco = params['eco']
      @cour.comments = params["cour"]["comments"]
      @cour.dispo = params['dispo']
      @cour.save
      redirect_to @student, notice: 'Inscription au cour modifié.'
    else
      render :edit
    end
  end

  # DELETE /cours/1
  # DELETE /cours/1.json
  def destroy
    @cour.destroy
    redirect_to @student, notice: 'Cour effacé.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cour
      @cour = Cour.find(params[:id])
    end
    def set_student
      @student = Student.find(params[:student_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def cour_params
      params.require(:cour).permit(:student_id, :discipline_id, :instrument_id, :user_id, :year_id, :plus, :eco, :dispo, :comments)
    end
end
