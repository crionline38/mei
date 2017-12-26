class AdherentController < ApplicationController
  before_action :set_adherent, only: [:show, :edit, :update]

  def index
    @adherents = User.all
  end

  def new
    p params
    @adherent = User.new
  end

  def create
    @adherent = User.new(adherent_params)
        if @adherent.save
                redirect_to adherent_path(@adherent), :notice => "Adhérent enregistré!"
        else
                render "new"
        end
  end

  def update
    myparams = adherent_params
    p myparams
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

  def edit
  end

  private

  def set_adherent
    @adherent = User.find(params[:id])
  end

  def adherent_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :address, :address2, :zipcode, :city, :tel1, :tel2, :function_id)
  end
end
