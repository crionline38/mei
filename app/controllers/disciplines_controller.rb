class DisciplinesController < ApplicationController
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]

  def index
    @disciplines = Discipline.where(valide: true).order('name')
  end

  def new
    @discipline = Discipline.new
  end

  def edit
  end

  def create
    @discipline = Discipline.new(discipline_params)
    if @discipline.save
      redirect_to @discipline, notice: 'Discipline crée.'
    else
      render :new
    end
  end

  def update
    if @discipline.update(discipline_params)
      redirect_to disciplines_path, notice: 'Discipline sauvegardée.'
    else
      render :edit
    end
  end

  def destroy
    @discipline.valide = false
    @discipline.save
    redirect_to disciplines_url, notice: 'Discipline effacée.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline
      @discipline = Discipline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_params
      params.require(:discipline).permit(:name, :duree, :frequence_id, :tarif_id)
    end
end
