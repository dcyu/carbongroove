#professor archer
#liz moyer


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

  def add_account
    @account_id = current_user.id
    @bank_username = params[:bank_username]
    @bank_password = params[:bank_password]
    IntuitIdsAggcat::Client::Services.delete_customer "#{@account_id}"
    IntuitIdsAggcat::Client::Services.discover_and_add_accounts_with_credentials 4, "#{@account_id}", { "usr_name" => "#{@bank_username}", "usr_password" => "#{@bank_password}" }
    current_user.get_transactions

    redirect_to current_user, :notice => "#{@account_id}"
  end

  def show
    # Interval.create_intervals_for_month

    @user = current_user
    if params[:full_date].nil?
      @view_date = Date.today
    else
      @view_date = Date.parse(params[:full_date])
    end
    @intervals = Interval.sort_by_month(current_user, params[:full_date])

    @goal = Goal.new

    #@receipts_by_day = current_user.receipts.order('date desc').group_by { |receipt| receipt.date.beginning_of_day }
    #@receipts = current_user.receipts.order('date desc').limit(50)
    # @intervals = Interval.order('start_range desc').where('user_id = ?', current_user.id)

    respond_to do |format|
      format.html # show.html.erb
      # format.json { render json: @receipts_by_day }

      # looking at JSON rendering
      # format.json  { render :json => @receipts_by_day.to_json(:include => { :date => { :only => [:id, :url] } }) }
      # format.json  { render json: @receipts_by_day.to_json() }
      # format.json  { render json: @receipts.to_json(:only => [:emission]) }
    end
  end



end
