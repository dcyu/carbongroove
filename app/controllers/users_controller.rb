class UsersController < ApplicationController
  def edit
    @user = RegularUser.find(params[:id])
  end

  def update
    if current_user.regular_user?
      @user = RegularUser.find(session[:user_id])
      @user.update_attributes(params[:user])
      redirect_to user_url
    end
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
    @receipts_by_day = current_user.receipts.order('date desc').group_by { |receipt| receipt.date.beginning_of_day }
    #@receipts_by_month = current_user.receipts.order('date desc').group_by { |receipt| receipt.date.beginning_of_month }
    @receipts = current_user.receipts.order('date desc').limit(50)
    @user = current_user
    @goal = Goal.new


  # @receipts_by_day.each do |day, purchases|
  #    daily_cost = []
  #    daily_emission = []

  #     purchases.sort_by {|obj| obj.created_at}.reverse.each do |purchase|
  #         purchase.kind
  #         purchase.cost
  #         purchase.emission kg of carbon dioxide
  #          daily_cost << purchase.cost.to_f
  #          daily_emission << purchase.emission.to_f

  #     end
  #     @month_total_cost = monthly_cost.inject { |sum, x| sum + x }
  #     @month_total_emission = monthly_emission.inject { |sum, x| sum + x }
  # end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @receipts_by_day }
    end
  end



end
