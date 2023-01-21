Rails.application.routes.draw do
  get 'rooms/index'
  root :to => 'home#index'

  get 'users/profile'
  get 'users/profile/edit', to: 'users#profile_edit'
  patch 'users/profile/update', to: 'users#profile_update'
  get 'users/account'
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :rooms do
    collection do
      get 'own'
    end
    
  end
end
