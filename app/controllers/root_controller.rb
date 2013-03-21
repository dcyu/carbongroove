class RootController < ApplicationController

  layout "root_layout"

	def index
    redirect_to current_user if current_user.present?
    @user = RegularUser.new
	end

  def about
    redirect_to current_user if current_user.present?
    @user = RegularUser.new
  end

  def contact
    redirect_to current_user if current_user.present?
    @user = RegularUser.new
  end
end