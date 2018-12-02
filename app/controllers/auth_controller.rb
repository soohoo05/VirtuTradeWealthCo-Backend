class AuthController < ApplicationController
  def create
    user = User.find_by({username: params[:username]})
    if (user && user.authenticate(params[:password]))
      token = JwtAuth.encode(username: user.username)
      render json: { token: user.token}
    else
      render json: {error: 'Invalid Password!'}
    end
  end

  def destroy
  end
end