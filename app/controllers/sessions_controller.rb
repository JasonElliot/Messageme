class SessionsController < ApplicationController

  def new

  end

  def create
    debugger
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(password: params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "successfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "login credentials are wrong"
      render 'new'
    end
  end
  def destroy
    session[user_id] = nill
    flash[:success] = "successfully logged out"
    redirect_to login_path
  end

end
