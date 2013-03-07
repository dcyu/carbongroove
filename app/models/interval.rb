class Interval < ActiveRecord::Base
  attr_accessible :start_range, :total_emission, :user_id

  has_many :receipts
  has_many :goals
  has_many :users

  def Interval.create_interval_if_needed(current_user, receipt)
    current_day = DateTime.now.beginning_of_day
    new_receipt_date = receipt.date

    logger.info "CURRENT USER IS ---> #{current_user}"
    logger.info "CURRENT DATETIME IS ---> #{current_day}"
    # logger.info "CURRENT RECEIPT DATETIME IS ---> #{receipt.date}"
    logger.info "CURRENT RECEIPT DATETIME IS ---> #{new_receipt_date}"

    # Find the interval if there is one
    search_interval_result = Interval.where(:start_range => new_receipt_date)

    logger.info "SEARCH INTERVAL FOR RECEIPT ---> #{search_interval_result.inspect}"
    logger.info "INTERVAL ---> #{search_interval_result.inspect}"

    if search_interval_result.empty?
      logger.info "NO INTERVAL FOR THIS DATE!"
      # Here's where we will make a new interval, use the receipt and user_id to fill it and save it.

      # puts "yo!"

    else

      logger.info "YES, WE HAVE AN INTERVAL FOR THIS DATE!"
      # Here's where we will update the interval that was returned in the where
      # and add this receipt emission to the interval's total emission.


    end

    # @receipts_by_day = current_user.receipts.order('date desc').group_by { |receipt| receipt.date.beginning_of_day }

    # @receipts_by_day.each do |day, purchases|
    #   logger.info "DAY IS ---> #{day}"

    #   daily_emission = Array.new
    #   purchases.each do |purchase|
    #     daily_emission << purchase.emission.to_f
    #     logger.info "$$$$$ DAILY EMISSION ENTRY ---> #{daily_emission}"
    #     purchase.date
    #   end

      # @new_interval = Interval.new
      # @new_interval.total_emission = daily_emission.map.inject{|sum, x| sum + x}.round(2).to_s
      # @new_interval.start_range = day
      # @new_interval.save
      # logger.info "After Save interval inspection::::!!!!!!!#{@new_interval.inspect}"
    # end

  end

  def Interval.do_something
    @something = "yo!!"
    return @something
  end


end
