class AuthController < ApplicationController
  def create
    user = User.find_by({username: params[:username]})
    if (user && user.authenticate(params[:password]))
      token = generate_token(user)
      render json: { token: token}
    else
      render json: {error: 'Invalid Password!'}, status: 400
    end
  end

  def destroy
    # makew JWT token xpire
    render json: {message: 'user logged out!'}
  end
end