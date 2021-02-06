require_relative "boot"

require "rails/all"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
     # 主にdeviseを使うのに必要
     config.middleware.use Rack::MethodOverride
     config.middleware.use ActionDispatch::Cookies
     config.middleware.use ActionDispatch::Session::CookieStore
     config.middleware.use ActionDispatch::Flash
 
     # クロスドメイン対策は入れておいたほうが良い
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