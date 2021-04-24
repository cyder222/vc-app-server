# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
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
                 headers: :any,
                 expose: %w(access-token expiry token-type uid client),
                 methods: %i(get post options delete put)
      end
    end
    schema_path = Rails.root.join("etc/docs/swagger/scheme/reference/rooms.v1.yaml").to_s
    config.middleware.use Committee::Middleware::RequestValidation, schema_path: schema_path
  end
end
