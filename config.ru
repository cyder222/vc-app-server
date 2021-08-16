# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

require 'rack/cors'
use Rack::Cors do
  # allow all origins in development
  allow do
    origins 'http://myapp.test.com:3001', 'http://myapp.test.com', 'https://vc-app-server-staging.herokuapp.com', 'https://voicechat-app-front.vercel.app/'
    resource '*',
        :headers => :any,
        :methods => [:get, :post, :delete, :put, :options]
  end
end