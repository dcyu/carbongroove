class Interval < ActiveRecord::Base
  attr_accessible :start_range, :total_emission

  has_many :receipts
  has_many :goals
  has_many :users

  def input_interval_data(current_user)
    current_day = DateTime.now
    logger.info "CURRENT DATETIME IS ---> #{current_day}"

    @receipts_by_day = current_user.receipts.order('date desc').group_by { |receipt| receipt.date.beginning_of_day }
    @receipts_by_day.each do |day, purchases|
      logger.info "DAY IS ---> #{day}"

      daily_emission = Array.new
      purchases.each do |purchase|
        daily_emission << purchase.emission.to_f.round(2)
        logger.info "$$$$$ DAILY EMISSION ENTRY ---> #{daily_emission}"
        purchase.date
      end
    interval = Interval.new
    interval.total_emission = daily_emission.map.inject{|sum, x| sum + x}.to_s
    interval.start_range = day
    interval.save
    logger.info "After Save interval inspection::::!!!!!!!#{@interval.inspect}"
    end
  end

end
