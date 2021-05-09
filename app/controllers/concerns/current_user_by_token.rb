module CurrentUserByToken
    def current_user
      token = bearer_token
      @current_token_user ||= User.find_by(oauth_token: token) if token
    end
  
    def current_user?(user)
      user == @current_token_user
    end
  
    def logged_in?
      !@current_token_user.nil?
    end
  
    def log_out
      @current_token_user = nil
    end
    
    def bearer_token
      @bearer_token ||= get_bearer_token
    end

    def get_bearer_token
      pattern = /^Bearer /
      header = request.headers['Authorization']
  
      header.gsub(pattern, '') if header&.match(pattern)
    end
  end