class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_dealer
    return if signed_in?

    save_location
    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end
end
