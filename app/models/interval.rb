class Interval < ActiveRecord::Base
  attr_accessible :start_range, :total_emission

  has_many :receipts
  has_many :goals
  belongs_to :user

  def Interval.create_interval_if_needed(current_user, receipt)
    current_day = DateTime.now.beginning_of_day
    new_receipt_date = receipt.date

    logger.info "CURRENT USER IS ---> #{current_user}"
    logger.info "CURRENT DATETIME IS ---> #{current_day}"
    # logger.info "CURRENT RECEIPT DATETIME IS ---> #{receipt.date}"
    logger.info "CURRENT RECEIPT DATETIME IS ---> #{new_receipt_date}"

    # Find the interval if there is one
    search_interval_result = Interval.where('start_range = ? AND user_id = ?', new_receipt_date, current_user.id)

    logger.info "SEARCH INTERVAL FOR RECEIPT ---> #{search_interval_result.inspect}"
    logger.info "INTERVAL ---> #{search_interval_result.inspect}"

    logger.info "what is receipt? #{receipt.attributes}"

    if search_interval_result.empty?
      logger.info "NO INTERVAL FOR THIS DATE!"
      # Here's where we will make a new interval, use the receipt and user_id to fill it and save it.

      interval = Interval.new
      interval.user_id = current_user.id
      interval.start_range = receipt.date
      interval.total_emission = receipt.emission
      interval.save
    else

      logger.info "YES, WE HAVE AN INTERVAL FOR THIS DATE!"
      # Here's where we will update the interval that was returned in the where
      # and add this receipt emission to the interval's total emission.

      receipts_by_day = current_user.receipts.order('date desc').group_by { |receipt| receipt.date.beginning_of_day }

      receipts_by_day.each do |day, purchases|
        daily_emission = []
        purchases.each do |purchase|
          daily_emission << purchase.emission.to_d
          logger.info "$$$$$ DAILY EMISSION ENTRY ---> #{daily_emission}"

          interval = Interval.where('start_range = ? AND user_id = ?', purchase.date, current_user.id).first
          interval.start_range = day
          interval.user_id = current_user.id
         interval.total_emission = daily_emission.map{ |i| i.to_d }.inject{|sum,x| sum + x }
          interval.save
          logger.info "After Save interval inspection::::!!!!!!!#{interval.inspect}"
          receipts = Receipt.where(date: interval.start_range)
            receipts.each do |receipt|
            receipt.interval_id = interval.id
            receipt.save
          end
        end
      end
    end

  end

  def Interval.do_something
    @something = "yo!!"
    return @something
  end


end
