class SessionsController < ApplicationController
  def new
  end

  def create
    # @receipts = Receipt.all
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      # render "index", :notice => "Logged in!"
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
