class User < ActiveRecord::Base
  has_many :goals
  has_many :receipts

  def facebook_user?
    oauth_token.present?
  end

  def regular_user?
    !facebook_user?
  end
end

