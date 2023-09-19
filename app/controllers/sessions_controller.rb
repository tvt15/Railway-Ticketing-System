class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:pnew,:anew, :create]
  def new
  end

  def create
    admin_user = Admin.find_by_email(params[:email])
    passenger_user = Passenger.find_by_email(params[:email])
  
    if admin_user && admin_user.authenticate(params[:password])
      session[:admin_id] = admin_user.id
      redirect_to admins_path
    elsif passenger_user && passenger_user.authenticate(params[:password])
      session[:passenger_id] = passenger_user.id
      redirect_to passengers_path
    else
      redirect_to root_path, notice: "Invalid login details" 
    end
  end
  

  def destroy
    if session[:admin_id] 
      session[:admin_id] = nil
    elsif session[:passenger_id]
      session[:passenger_id] = nil
    end
    redirect_to root_path
    
  end
end
