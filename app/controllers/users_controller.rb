class UsersController < ApplicationController
  before_action :logged_dealer, only: [:show]

  def index; end

  def show
    @user = User.find(current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:notice] = "Welcome to the Alpha Blog #{@user.name}, You have successfully signed up"
      redirect_to @user
    else
      flash.now[:alert] = 'There was something wrong with your login details, Please try again'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
