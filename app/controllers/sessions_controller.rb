class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user
      sign_in user
      flash[:notice] = 'You have Signed in successfully'
      redirect_user_back user
    else
      flash.now[:alert] = 'There was something wrong with your login details, Please try again'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
