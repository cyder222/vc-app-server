# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :categories, only: %i(index)
    resources :rooms, only: %i(index show create) do
      resources :users, only: %i(index create destroy), controller: 'rooms/users'
    end
    resources :users, controller: :users, only: %i(show) do
      collection do
        get :current
      end
    end
  end

  resource :sessions, controller: :sessions, only: %i(new create destroy)
  get 'auth/:provider', to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
