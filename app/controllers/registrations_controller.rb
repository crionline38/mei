class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    adherent_query_path(resource) # Or :prefix_to_your_route
  end
end
