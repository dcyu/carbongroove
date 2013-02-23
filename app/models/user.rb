class User < ActiveRecord::Base
  attr_accessible :email, :password

  has_many :goals
  has_many :receipts

  def facebook_user?
    oauth_token.present?
  end

  def regular_user?
    !facebook_user?
  end
end

