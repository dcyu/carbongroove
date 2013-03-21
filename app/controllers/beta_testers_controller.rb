class BetaTestersController < ApplicationController

  def create
    @beta_tester = BetaTester.new(params[:beta_tester])
    if @beta_tester.save!
      redirect_to root_url, :notice => "Thank you, your information has been saved!"
    end
  end

end