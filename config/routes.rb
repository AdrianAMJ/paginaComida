Rails.application.routes.draw do
  resources :products do
    collection do
      get :platos_principales
    end
  end

  devise_for :users, controllers: { registrations: 'users/registrations'  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'home#index'

  get "/contacto", to: 'home#contacto'
end
