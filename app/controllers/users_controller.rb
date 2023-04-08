class UsersController < ApplicationController

  def index 
    users = User.all
    render json: users
  end 
end


def new
  user = User.new
end

def create
  user = User.new(user_params)
  if user.save
    render json: user, status: :created
  else 
    render json: user.errors
  end
end

def sign_in
  user = User.find_by(email: params[:email])
  
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    render json: { message: "Sign in was successful", user: user  }
  else 
    render json: { message: "Invalid email or password" }
  end
end

def sign_out
  session[:user_id] = nil
  render json: { message: "You have been logged out successfully"}
end



private 

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password)
end