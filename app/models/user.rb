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
  # need to ask twitter user for email after authenticate

  def regular_user?
    provider == nil
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

  def twitter
    @twitter ||= Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret)
  end

  #fix everything in receipts and intervals
  #receipts table add 'transaction_id' migration
  #add the following to user.rb

  def get_transactions
    logger.info "GET transactions"
    b = ACCOUNT.banking_transactions
    logger.info "GET transactions #{b}"

    b.each do |transaction|
      if transaction.categorization.context != nil && Receipt.find_by_transaction_id(transaction.id).blank?
        logger.info "do transactions"
        r = Receipt.new
        r.user_id = self.id
        r.transaction_id = transaction.id
        r.kind = transaction.categorization.context.category_name
        r.date = transaction.posted_date
        r.cost = transaction.amount
        r.emission = nil
        r.interval_id = nil
        r.save!
      end
    end
      return b
  end


  #your relevant transactions from the specified account should now be saved as receipts, however DO NOT push this to github without modifying the intuit initializer as your bank account login info is listed

end

