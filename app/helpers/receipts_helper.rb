module ReceiptsHelper
  def daily_total_cost(receipts)
    receipts.each do |day, purchases|
      daily_cost = []
      purchases.sort_by{|obj| obj.created_at}.reverse.each do |purchase|
        daily_cost << purchase.cost.to_f
      end
      daily_total_cost = daily_cost.inject { |sum, x| sum + x }
      puts "c: #{daily_total_cost}"
      return daily_total_cost
    end
  end

  def daily_total_emission(receipts)
    receipts.each do |day, purchases|
      daily_emission = []
      purchases.sort_by{|obj| obj.created_at}.reverse.each do |purchase|
        daily_emission << purchase.emission.to_d.round(3)
      end
      daily_total_emission = daily_emission.inject { |sum, x| sum + x }
      return daily_total_emission
    end
  end
end
