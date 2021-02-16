# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: { omniauth_callbacks: 'api/users/omniauth_callbacks' }
    resources :categories, only: %i(index)
    resources :rooms, only: %i(index show)
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
