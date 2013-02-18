class SessionsController < ApplicationController
  skip_before_filter :require_current_user

  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url

    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to current_user
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end


end
