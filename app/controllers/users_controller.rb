class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      user = User.authenticate(@user.email, @user.password)
      session[:user_id] = user.id
      redirect_to current_user, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @receipts = current_user.receipts
  end



end
