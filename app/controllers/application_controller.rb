class ApplicationController < ActionController::API
  private

  def generate_token(user)
    token = JwtAuth.encode(username: user.username)
  end

  def current_user
    @current_user || User.find_by(username: decoded_token[:data][:username])
  end

  def decoded_token
    JwtAuth.decode(request.headers[:token])
  end
end
