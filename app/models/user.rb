class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :name

  has_many :goals
  has_many :receipts

  def facebook_user?
    oauth_token.present?
  end

  def regular_user?
    !facebook_user?
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

end

