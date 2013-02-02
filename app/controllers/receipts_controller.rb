class ReceiptsController < ApplicationController
  
  def index
    @receipt = Receipt.create params[:receipt]
    redirect_to @receipt
  end

  def new
    @receipt = Receipt.new
    @receipt.user_id = current_user.id
    logger.debug "ID: #{current_user.id}" 
  end

  def create
    @receipt = Receipt.create params[:receipt]
    redirect_to @receipt
    params[:selected]="none"
    params[:receipt][:user_id] = @receipt.user_id
  end

  def show
    @receipt = Receipt.find params[:id]
  end
end