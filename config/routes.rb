Rails.application.routes.draw do
  resources :outputs
  resources :inputs
  resources :items
  resources :sectors
  resources :types
  resources :secretaries
  resources :enterprises
  resources :addresses
  resources :phones
  # root to: 'visitors#index'
  # root to: 'items#index'

  get 'qr_code', to: 'items#qr_code'

  devise_for :users,
    controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      passwords: 'users/passwords'
    }
  resources :users

  authenticated :user do
    root 'items#index'
  end

  devise_scope :user do
    root "devise/sessions#new"  
  end
end
