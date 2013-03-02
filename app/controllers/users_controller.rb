class UsersController < ApplicationController
  def edit
    @user = RegularUser.find(params[:id])
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    redirect_to user_url
  end

  def new
    @user = User.new
  end

  def create
    @user = RegularUser.new(params[:user])

    if @user.save!
      session[:user_id] = @user.id
      redirect_to current_user, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @receipts_by_month = current_user.receipts.order('date desc').group_by { |receipt| receipt.date.beginning_of_month }
    @receipts = current_user.receipts.order('date desc').limit(50)



    @emissions_by_month


    @user = User.find(params[:id])
    @goal = Goal.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @receipts }
    end
  end



end
