class TarifsController < ApplicationController
  before_action :set_tarif, only: [:show, :edit, :update, :destroy]

  # GET /tarifs
  # GET /tarifs.json
  def index
    @tarifs = Tarif.where(valide: true).order('name')
  end

  # GET /tarifs/1
  # GET /tarifs/1.json
  def show
  end

  # GET /tarifs/new
  def new
    @tarif = Tarif.new
  end

  # GET /tarifs/1/edit
  def edit
  end

  # POST /tarifs
  # POST /tarifs.json
  def create
    @tarif = Tarif.new(tarif_params)
    @tarif.valide = true
    if @tarif.save
      redirect_to tarifs_path, notice: 'Tarif crée.'
    else
      render :new
    end
  end

  # PATCH/PUT /tarifs/1
  # PATCH/PUT /tarifs/1.json
  def update
    if @tarif.update(tarif_params)
      redirect_to tarifs_path, notice: 'Tarif updaté.'
    else
      render :edit
    end
  end

  # DELETE /tarifs/1
  # DELETE /tarifs/1.json
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
