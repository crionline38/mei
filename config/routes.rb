Rails.application.routes.draw do

  get 'adherent/index'
  get 'adherent/show'
  get 'adherent/edit'


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
