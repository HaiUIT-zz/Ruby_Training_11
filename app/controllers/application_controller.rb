class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # if a request need to be authenticated, call this
  def authenticate_request!
    if !payload || !Auth.valid_payload(payload)
      
    else
      load_current_user!
      false unless @current_user
    end
  end

  private

  # Deconstructs the Authorization header and decodes the JWT token.
  def payload
    token = cookies[:jwt]
    Auth.decode(token)
  end
  
  # Sets the @current_user with the user_id from payload
  def load_current_user!
    @current_user = User.find_by(id: payload[0]['user_id'])
  end
end
