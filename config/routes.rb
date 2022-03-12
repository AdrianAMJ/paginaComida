Rails.application.routes.draw do
  resources :products do
      put :update, to: 'products#update', as: :update
    collection do
      get :platos_principales
      get :entradas
      get :postres
    end
  end

  devise_for :users, controllers: { registrations: 'users/registrations'  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'home#index'

  get "/contacto", to: 'home#contacto'

  resources :users do
    resources :addresses
  end

end
