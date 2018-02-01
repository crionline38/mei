Rails.application.routes.draw do

    resources :students
  resources :adherent do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
