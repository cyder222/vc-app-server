class OptionsRequestController < ApplicationController
    ACCESS_CONTROL_ALLOW_METHODS = %w(GET POST PUT DELETE OPTIONS).freeze
    ACCESS_CONTROL_ALLOW_HEADERS = %w(Authorization Content-Type Accept Origin User-Agent DNT Cache-Control X-Mx-ReqToken Keep-Alive X-Requested-With If-Modified-Since).freeze
    
    protect_from_forgery except: :preflight
    before_action :set_preflight_headers!, only: [:preflight]

    def preflight
      set_preflight_headers!
      head :ok
    end
  
    private
  
    def set_preflight_headers!
      response.headers['Access-Control-Allow-Origin'] = "*"
      response.headers['Access-Control-Allow-Headers'] = ACCESS_CONTROL_ALLOW_HEADERS.join(',')
      response.headers['Access-Control-Allow-Methods'] = ACCESS_CONTROL_ALLOW_METHODS.join(',')
    end
  end