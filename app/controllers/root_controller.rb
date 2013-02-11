class RootController < ApplicationController
	def index
    redirect_to current_user if current_user.present?
	end
end