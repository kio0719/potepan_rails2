Rails.application.routes.draw do
  root :to => 'home#index'

  get 'users/profile'
  get 'users/profile/edit', to: 'users#profile_edit'
  patch 'users/profile/update', to: 'users#profile_update'
  get 'users/account'
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  # マイページのルーティング
  get 'users/profile', to: 'users#profile', as: 'user_profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
