class UsersController < ApplicationController

def create
  @user= User.create(user_params)
  if @user.valid?
  render json:@user
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
  @userlist = @user.ccurrencys
  render json: {"user": @user, "currencies": @userlist}
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
  @userlist = @user.ccurencys
  # byebug
  render json: {"user": @user, "currencies": @userlist}

end



private

def user_params
  params.require(:user).permit(:name,:username,:password)
end
end
