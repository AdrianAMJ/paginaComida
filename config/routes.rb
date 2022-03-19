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
    resources :carritos do
      get '/agregar_item', to: 'carritos#agregar_item', as: 'agregar_item'
      get '/quitar_item', to: 'carritos#quitar_item', as: 'quitar_item'
    end
  end

end
