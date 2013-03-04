class Interval < ActiveRecord::Base
  attr_accessible :start_range, :total_emission
  has_many :receipts
  has_many :goals
  has_many :users

  def calculate_total_emission(user)
    @receipts_by_day = user.receipts.order('date desc').group_by { |receipt| receipt.date.beginning_of_day }
      @receipts_by_day.each do |day, purchases|
        daily_emission = []
        purchases.each do |purchase|
          daily_emission << purchase.emission.to_f
          purchase.date
        end
        total_emission = daily_emission.map.inject{|sum, x| sum + x}.to_s

       interval = Interval.new
       interval.total_emission = total_emission
       interval.start_range = day
       interval.save
      logger.info "After Save interval inspection::::!!!!!!!#{@interval.inspect}"
      end
  end


  def input_interval_data(current_user)
    self.calculate_total_emission(current_user)
    self.start_range

  end


  # @receipts_by_day.each do |day, purchases|
  #   day.strftime("%B %e, %Y")
  #   daily_cost = []
  #   daily_emission = []

  #    purchases.sort_by {|obj| obj.created_at}.reverse.each do |purchase|
  #       Date.parse(purchase.date.to_s)
  #         purchase.kind
  #         purchase.cost
  #         purchase.emission kg of carbon dioxide
  #         daily_cost << purchase.cost.to_f
  #         daily_emission << purchase.emission.to_f
  #    end
  #    daily_total_cost = daily_cost.inject { |sum, x| sum + x }
  #    daily_total_emission = daily_emission.inject { |sum, x| sum + x }

  #    The total cost of purchases on day.strftime("%D") is number_to_currency(daily_total_cost)</li>
  #    The total emission on day.strftime("%D") is number_with_precision(daily_total_emission, :precision => 2)


end
