class SessionsController < ApplicationController
  skip_before_filter :require_current_user

  def new
  end

  def create
    @user = RegularUser.authenticate(params[:email], params[:password])
    if
      session[:user_id] = @user.id
      # UserMailer.login_confirmation(@user).deliver
      redirect_to current_user
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def create_facebook
    @user = FacebookUser.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    # UserMailer.login_confirmation(@user).deliver
    redirect_to current_user      
  end

  def create_twitter
    user = TwitterUser.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to current_user      
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end


end
