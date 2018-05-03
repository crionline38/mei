class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :testsaison

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :address2, :zipcode, :city, :tel1, :tel2, :function_id])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def testsaison
      @adherent = current_user
      session['saison'] = params['saison'].to_i if params['saison']
      session['saison'] ? @saison = Year.find(session['saison'].to_i) : @saison = Year.all.order('name').last
      @jours ="Lundi Mardi Mercredi Jeudi Vendredi Samedi Dimanche".split(' ')
      @recurences ="Toutes les semaines,Semaines paires,Semaines impaires,Une seule fois".split(',')
      p @recurences
      if current_user
        @auth = ["Bureau", "Secrétaire", "Trésorier", "Président", "Admin"].include?(current_user.function.name) || current_user.email == "maildecri@gmail.com"
      else
        @auth = false
      end
  end
end
