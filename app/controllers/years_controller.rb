class YearsController < ApplicationController
  before_action :set_year, only: [:show, :edit, :update, :destroy]

  def index
    @years = Year.where(valide: true).order('name DESC')
  end

  def new
    @year = Year.new
  end

  def edit
  end

  def create
    @year = Year.new(year_params)
      if @year.save
        redirect_to years_path, notice: 'Saison créée.'
      else
        render :new
      end
  end

  def update
    if @year.update(year_params)
      redirect_to years_path, notice: 'Saison updatée.'
    else
      render :edit
    end
  end

  def destroy
    @year.valide = false
    @year.save
    redirect_to years_url, notice: 'Saison effacée.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year
      @year = Year.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def year_params
      params.require(:year).permit(:name)
    end
end
