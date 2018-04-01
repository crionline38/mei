class TarifsController < ApplicationController
  before_action :set_tarif, only: [:show, :edit, :update, :destroy]

  def index
    @tarifs = Tarif.where(valide: true).order('name')
  end

  def new
    @tarif = Tarif.new
  end

  def edit
  end

  def create
    @tarif = Tarif.new(tarif_params)
    if @tarif.save
      redirect_to tarifs_path, notice: 'Tarif crée.'
    else
      render :new
    end
  end

  def update
    if @tarif.update(tarif_params)
      redirect_to tarifs_path, notice: 'Tarif updaté.'
    else
      render :edit
    end
  end

  def destroy
    @tarif.valide = false
    @tarif.save
    redirect_to tarifs_url, notice: 'Tarif Effacé.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarif
      @tarif = Tarif.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarif_params
      params.require(:tarif).permit(:name, :a, :b, :c)
    end
end
