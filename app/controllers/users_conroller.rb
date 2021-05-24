class UsersController < ApplicationController
  before_action :logged_dealer, only: [:show]
  
  def index

  end
  
  def show
    @user = User.find(current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to Dealo Application!'
      redirect_to @user
    else
      flash[:danger] = 'Please try again'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end