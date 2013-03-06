class Interval < ActiveRecord::Base
  attr_accessible :start_range, :total_emission

  has_many :receipts
  has_many :goals
  has_many :users

  def Interval.input_interval_data(current_user, receipt)
    current_day = DateTime.now.beginning_of_day
    new_receipt_date = receipt.date

    logger.info "CURRENT USER IS ---> #{current_user}"
    logger.info "CURRENT DATETIME IS ---> #{current_day}"
    # logger.info "CURRENT RECEIPT DATETIME IS ---> #{receipt.date}"
    logger.info "CURRENT RECEIPT DATETIME IS ---> #{new_receipt_date}"

    # search for the inteval for today's receipt date
    # search_interval_result = Interval.where(:start_range => new_receipt_date)
    search_interval_result = Interval.where(:start_range => new_receipt_date)

      # @flights = Flight.where("departure_airport LIKE ? OR arrival_airport LIKE ? AND seats > 0", "%#{keyword_search}%", "%#{keyword_search}%").limit(500)


    logger.info "SEARCH INTERVAL FOR RECEIPT ---> #{search_interval_result.inspect}"
    logger.info "INTERVAL ---> #{search_interval_result.inspect}"

    if search_interval_result.empty?
      logger.info "NO INTERVAL FOR THIS DATE!"
    else
      logger.info "YES, WE HAVE AN INTERVAL FOR THIS DATE!"
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
