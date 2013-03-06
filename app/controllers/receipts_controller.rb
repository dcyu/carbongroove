class ReceiptsController < ApplicationController

  # Create new table "Emission" for storing all the :kind information

  def new
    @receipt = Receipt.new
    @receipt.user_id = current_user.id
    logger.debug "ID: #{current_user.id}"

  end

  def create
    logger.info "--> create receipt params = #{params[:receipt]} <--"
    @receipt = current_user.receipts.create params[:receipt]

    # @interval = Interval.new
    # @interval.input_interval_data(current_user)

    redirect_to @receipt
  end

  def show
    @receipt = Receipt.find params[:id]

  end
end
