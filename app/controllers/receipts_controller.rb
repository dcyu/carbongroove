class ReceiptsController < ApplicationController
  def new
  end

  def create
    @receipt = Receipt.create params[:receipt]
    redirect_to @receipt
  end

  def show
    @receipt = Receipt.find params[:id]
  end
end