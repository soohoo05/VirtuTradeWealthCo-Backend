class UsersController < ApplicationController

def create
  @user= User.create(user_params)
  if @user.valid?
    generate_token(@user)
    token = generate_token(@user)
    render json: { user_id: @user.id,
       username: @user.username , 
       name: @user.name, token: token}
  else
    render json: {"error": @user.errors.full_messages}, status: 422
  end
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
end

def show
  @user = User.find(params[:id])
  @asset_list = @user.assets
  render json: {"user": @user, "assets": @asset_list}
end

def update
  @user = User.find(params[:id])
  @user.update(user_params)
  if @user.valid?
    render json:@user
  else
    render json: {"error": @user.errors.full_messages}, status: 422
end
end

def find_user
  @user = User.find_by(username: params[:username])
  @asset_list = @user.assets
  # byebug
  render json: {"user": @user, "assets": @asset_list}

end


private

def user_params
  params.require(:user).permit(:name,:username,:password)
end
end
