class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:ajax, :ajaxd]
  def index
    @instruments = Instrument.where(valide: true).order('name')
    @intrument = @instruments.first
    if params['instru']
      @active = params['instru'].to_i
      @instrument = Instrument.find(@active)
      Instrud.create({instrument: @instrument, discipline: Discipline.find(params['formule'].to_i)}) if params['formule'] and @auth
      if params['dformule'] and @auth
        instrud = Instrud.find_by(instrument: @instrument, discipline: Discipline.find(params['dformule']))
        instrud.destroy if instrud

      end
    else
      @active = @instruments.first.id
    end
      @formules = Discipline.joins(:instruments).where(instruments: {id: @active})
      @allformules = Discipline.all.order('name')
  end

  def ajax
    @formules = Discipline.joins(:instruments).where(instruments: {id: params["instrument_id"]})
    render :layout => false
  end

  def ajaxd
    @crenaus = Crenau.where(instrument: params["instrument_id"]).rewhere(discipline: params["discipline"]).rewhere(year: @saison).rewhere(valide: true).order(:jour)
    @cour = Cour.new
    @cour.plus = false
    @cour.eco = false
    render "_ajaxd", :layout => false
  end

  def new
    @instrument = Instrument.new
  end

  def edit
  end

  def create
    @instrument = Instrument.new(instrument_params)
    if @instrument.save
      redirect_to @instrument, notice: 'Instrument was successfully created.'
    else
      render :new
    end
  end

  def update
    if @instrument.update(instrument_params)
      redirect_to @instrument, notice: 'Instrument was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @instrument.valide = false
    @instrument.save
    redirect_to instruments_url, notice: 'Instrument Effacé.'
  end

private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:name)
  end
end
