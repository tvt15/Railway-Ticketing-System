class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
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
      redirect_to root_url
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_url
  end
end
