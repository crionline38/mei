class AdherentController < ApplicationController
  before_action :set_adherent, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      @title = "Résultats"
      @adherents = User.where(sql_query, query: "%#{params[:query]}%").order('function_id, first_name')
    else
      @title = "Adhérents"
      @adherents = User.joins(:years).where(years: {name: @saison.name}).order('first_name DESC')
    end
    @link = "Adhérent"
    render "index"
  end

  def bureau
    @title = "Membre du bureau "
    @link = "Bureau"
    @adherents = User.joins(:function).where("functions.name = 'Président' OR functions.name = 'Trésorier' OR functions.name = 'Secrétaire' OR functions.name = 'Bureau'").order('function_id').reverse
    render "index"
  end

  def profs
    @title = "Professeurs"
    @link = "Professeur"
    @adherents = User.joins(:function).where(functions: {name: "Professeur"}).order('first_name')
    render "index"
  end

  # def crenaus
  #   @adherent = User.find(params[:adherent_id])
  #   @crenaus = Crenau.where(year: @saison).rewhere(user: @adherent).order(:valide, :jour)
  # end

  def new
    params['role'] ? @role = params['role'] : @role = "Adhérent"
    @adherent = User.new
    @adherent.function = Function.find_by(name: @role)
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
    @crenaus = Crenau.where("year_id = '#{@saison.id}' AND user_id = '#{@adherent.id}'")
    @adhesion = Adhesion.find_by(user: current_user, year: @saison)
  end

  def root
    redirect_to adherent_path(current_user)
  end

  def profile

    @adherent = User.find(params[:adherent_id])
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
