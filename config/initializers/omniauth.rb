# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  @outh_config = YAML.load_file("#{Rails.root}/config/secrets.yml")[Rails.env].symbolize_keys!
  provider :google_oauth2, @outh_config[:google_auth]['key'], @outh_config[:google_auth]['secret'],
           name: :google_oauth2, scope: %w(email)
end
