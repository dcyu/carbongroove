class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :name

  has_many :goals
  has_many :receipts

  def facebook_user?
    provider == "facebook"
  end

  def twitter_user?
    provider == "twitter"
  end

  def regular_user?
    provider == nil
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

  def twitter
    @twitter ||= Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret)
  end

end

