Rails.application.routes.draw do


  resources :years
  resources :instruments
  resources :tarifs
  resources :disciplines

  resources :students do
    resources :cours

  end
  resources :adherent do
    resources :adhesions, only: [:new, :update]
    resources :students
    get 'query', to: 'students#query'
    get 'yes', to: 'students#yes'
    get 'querytwo', to: 'students#querytwo'
  end

devise_for :users, controllers: { registrations: "registrations" }
  devise_scope :user do
    authenticated :user do
      root 'adherent#profile', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
root 'pages#home'

get 'profs', to: 'adherent#profs'
get 'bureau', to: 'adherent#bureau'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
