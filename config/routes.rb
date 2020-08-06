Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  # devise_scope :user do
  #   post 'users/:id', to: 'users/registrations#new'
  # end

  root to: 'items#index'
  resources :items

end