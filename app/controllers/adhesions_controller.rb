class AdhesionsController < ApplicationController
  before_action :set_adhesion, only: [ :edit, :update, :destroy]
  def new
    @adhesion = Adhesion.new
    @adhesion.user = User.find(params["adherent_id"])
    @adhesion.year = @saison
    @adhesion.save
    redirect_to(request.env['HTTP_REFERER'])
  end

  # GET /adhesions/1/edit
  # PATCH/PUT /adhesions/1
  # PATCH/PUT /adhesions/1.json
  def update
    if @adhesion.update(adhesion_params)
      redirect_to @adhesion, notice: 'Adhesion was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /adhesions/1
  # DELETE /adhesions/1.json
  def destroy
    @adhesion.destroy
    redirect_to(request.env['HTTP_REFERER'])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adhesion
      @adhesion = Adhesion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adhesion_params
      params.require(:adhesion).permit(:year, :user_id)
    end
end
