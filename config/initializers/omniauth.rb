# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
    auth_key = ENV['google_auth_key']
    auth_secret = ENV['google_auth_secret']
    provider :google_oauth2, auth_key, auth_secret,
             name: :google_oauth2, scope: %w(profile)
end
