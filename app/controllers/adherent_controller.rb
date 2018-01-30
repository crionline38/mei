class AdherentController < ApplicationController
  before_action :set_adherent, only: [:show, :edit, :update, :destroy]

  def index
    @adherents = User.all
  end

  def new
    @adherent = User.new
  end

  def create
    @adherent = User.new(adherent_params)

        if @adherent.save
                redirect_to adherent_query_path(@adherent), :notice => "Adhérent enregistré!"
        else
                render "new"
        end
  end

  def update
    myparams = adherent_params
    @adherent.first_name = myparams["first_name"]
    @adherent.last_name = myparams["last_name"]
    @adherent.address = myparams["address"]
    @adherent.address2 = myparams["address2"]
    @adherent.zipcode = myparams["zipcode"]
    @adherent.city = myparams["city"]
    @adherent.tel1 = myparams["tel1"]
    @adherent.tel2 = myparams["tel2"]
    @adherent.function_id = myparams["function_id"]
        if @adherent.save
                redirect_to adherent_path(@adherent), :notice => "Adhérent enregistré!"
        else
                render "edit"
        end
  end

  def show
  end

  def profile
    redirect_to adherent_path(current_user)
  end

  def edit
  end

  def destroy
    @adherent.destroy
    redirect_to adherent_index_path, notice: 'Adhérent effacé.'
  end

  private

  def set_adherent
    @adherent = User.find(params[:id])
  end

  def adherent_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :address, :address2, :zipcode, :city, :tel1, :tel2, :function_id)
  end
end
