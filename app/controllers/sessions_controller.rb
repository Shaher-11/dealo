class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      sign_in user
      flash[:success] = 'You have Signed in successfully'
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid name, Please try again'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
end