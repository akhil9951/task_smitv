Rails.application.routes.draw do
  resources :orders
  resources :products
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "home#index"
  resource :products
  resource :orders
  resources :payment, :only => [:create, :show]

  resources :product, :only => [:show] do
      member do
        get :search
      end
    end

  get '/confirmation_pending' => 'home#after_registration_path'


end
