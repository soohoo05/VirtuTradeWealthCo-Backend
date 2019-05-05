class AuthController < ApplicationController
  def create
    user = User.find_by({username: params[:username]})
    if (user && user.authenticate(params[:password]))
      token = generate_token(user)
      
      render json: {
         user_id: user.id,
          name: user.name,
          username: user.username,
          token: token}
    else
      render json: {error: 'Invalid Password!'}, status: 400
    end
  end

  def show
    # byebug
      # string = request.authorization
      # token = JWT.decode(string, 'SECRET')[0]
      token=decoded_token
      id = token["user_id"].to_i
    
      @user = User.find(id)
      if @user
        render json: {user_id: @user.id, 
          name: user.name ,
          username: @user.username}
      else
        render json: {error: "some error"}, status: 422
      end
    end

  def destroy
    # makew JWT token xpire
    render json: {message: 'user logged out!'}
  end
end
