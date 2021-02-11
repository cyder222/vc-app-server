Rails.application.config.middleware.use OmniAuth::Builder do
   OAUTH_CONFIG = YAML.load_file("#{Rails.root}/config/secrets.yml")[Rails.env].symbolize_keys!
   provider :google_oauth2, OAUTH_CONFIG[:google_auth]['key'], OAUTH_CONFIG[:google_auth]['secret'], name: :google_oauth2, scope: %w(email)
end