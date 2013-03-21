class BetaTestersController < ApplicationController

  def create
    @beta_tester = BetaTester.new(:email => params[:email])
    if @beta_tester.save!
      redirect_to root_url, :notice => "Thank you, your information has been saved!"
    end
  end

end