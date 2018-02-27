class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]

  # GET /instruments
  # GET /instruments.json
  def index
    @instruments = Instrument.where(valide: true).order('name')
  end

  # GET /instruments/1
  # GET /instruments/1.json
  def show
  end

  # GET /instruments/new
  def new
    @instrument = Instrument.new
  end

  # GET /instruments/1/edit
  def edit
  end

  # POST /instruments
  # POST /instruments.json
  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.valide = true

      if @instrument.save
        redirect_to @instrument, notice: 'Instrument was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /instruments/1
  # PATCH/PUT /instruments/1.json
  def update
      if @instrument.update(instrument_params)
        redirect_to @instrument, notice: 'Instrument was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /instruments/1
  # DELETE /instruments/1.json
  def destroy
    @instrument.valide = false
    @instrument.save
    redirect_to instruments_url, notice: 'Instrument Effacé.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrument_params
      params.require(:instrument).permit(:name)
    end
end
