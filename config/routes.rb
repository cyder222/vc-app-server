Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: { omniauth_callbacks: "api/users/omniauth_callbacks" }
    mount SwaggerUiEngine::Engine, at: '/swagger'
    resources :apidocs, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
