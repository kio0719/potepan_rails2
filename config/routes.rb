Rails.application.routes.draw do
  root :to => 'home#index'

  get 'users/index'
  get 'users/profile'
  get 'users/profile/edit', to: 'users#profile_edit'
  patch 'users/profile/update', to: 'users#profile_update'
  get 'users/account'
  get 'users/account/edit', to: 'users#account_edit'
  patch 'users/account/update', to: 'users#account_update'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
