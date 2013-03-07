class RootController < ApplicationController
	def index
    redirect_to current_user if current_user.present?
    @user = RegularUser.new
	end
end