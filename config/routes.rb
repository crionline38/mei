Rails.application.routes.draw do


  resources :years, except: [:show]
  resources :instruments, except: [:show] do
    get 'ajax', to: "instruments#ajax"
    get 'ajaxd', to: "instruments#ajaxd"
  end
  resources :tarifs, except: [:show]
  resources :disciplines, except: [:show]

  resources :students do
    resources :cours
  end
  # resources :crenaus
  resources :adherent do
    resources :adhesions, only: [:new, :update]
    resources :students
    get 'query', to: 'students#query'
    get 'yes', to: 'students#yes'
    get 'querytwo', to: 'students#querytwo'
    get 'profile', to: "adherent#profile"
    resources :crenaus do
      get 'ajax', to: "crenaus#ajax"
    end
  end
  resources :users, only: [] do
    resources :crenaus, only: [:create, :show, :update, :destroy]
  end
devise_for :users, controllers: { registrations: "registrations" }
  devise_scope :user do
    authenticated :user do
      root 'adherent#root', as: :authenticated_root
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
