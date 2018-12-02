class ApplicationController < ActionController::API
  private

  def authenticate_user
    if current_user_token && decoded_token[:data]
      true
    else
      render json: {error: 'Empty/Invalid Token'}
    end
  end

  def current_user
    @current_user || User.find_by(username: decoded_token[:data][:username])
  end

  def current_user_token
    request.headers[:token]
  end

  def decoded_token
    JwtAuth.decode(current_user_token)
  end

  def generate_token(user)
    token = JwtAuth.encode(username: user.username)
  end  
end
