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
    @receipts = current_user.receipts.order('date desc').limit(50)
    @total_receipts = []

    min_date = Receipt.all.map(&:date).min
    max_date = Receipt.all.map(&:date).max

    date = min_date

    while date <= max_date
      #receipts = Receipt.for_month(date.year, date.month)
      receipts = current_user.receipts.for_month(date.year, date.month)

      @total_receipts = [receipts] + @total_receipts
      date = date.next_month
    end
    ####after creating user authentication, this should work.
    #current_user.receipts
    # @receipts_1 = Receipt.for_month(2013, 1)
    # @receipts_2 = Receipt.for_month(2013, 2)

    @user = User.find(params[:id])
    @goal = Goal.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @receipts }
    end
  end



end
