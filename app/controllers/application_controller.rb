class ApplicationController < ActionController::Base

  helper_method :current_user
  before_action :authorized
  helper_method :logged_in?


  def current_user
    if session[:admin_id]
      @current_user ||= Admin.find(session[:admin_id])
    elsif session[:passenger_id]
      @current_user ||= Passenger.find(session[:passenger_id])
    else
      @current_user = nil
    
    end
    
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to root_path unless logged_in?
  end

end
