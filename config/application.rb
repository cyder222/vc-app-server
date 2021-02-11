require_relative "boot"

require "rails/all"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0


     config.middleware.use Rack::MethodOverride
     config.middleware.use ActionDispatch::Cookies
     config.middleware.use ActionDispatch::Session::CookieStore
     config.middleware.use ActionDispatch::Flash
 
     # クロスドメイン対策はとりあえず全部受ける
     config.middleware.insert_before 0, Rack::Cors do
        allow do
          origins '*'
          resource '*',
                    :headers => :any,
                    :expose => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
                    :methods => [:get, :post, :options, :delete, :put]
        end
      end
    end
end