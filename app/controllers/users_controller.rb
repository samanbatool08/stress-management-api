class UsersController < ApplicationController

  def index 
    users = User.all
    render json: users
  end 
end


def new
end

def create
end

def sign_in
end

def log_out
end




private 

def user_params
end