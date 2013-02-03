class Receipt < ActiveRecord::Base
  attr_accessible :kind, :cost, :user_id

  belongs_to :user

  def emission
    unit_cost_kind = Hash.new
    unit_cost_kind = {
      "electricity" => 0.155,
      "gasoline" => 4.00,
      "computer" => 1300.00,
      "cheeseburger" => 7.00,
      "banana" => 1.00,
      "veggie sandwich" => 5.00,
      "meat sandwich" => 5.00,
      "chicken burrito" => 7.00,
      "beef burrito" => 7.00,
      "rice" => 4.00,
      "flavored beverage" => 2.00,
      "bottled water" => 1.00,
      "potato chips" => 1.00,
    }

    unit_emission_kind = Hash.new
    unit_emission_kind = {
      "electricity" => 0.527,
      "gasoline" => 12.60,
      "computer" => 720.00,
      "cheeseburger" => 2.50,
      "banana" => 0.08,
      "veggie sandwich" => 0.40,
      "meat sandwich" => 0.80,
      "chicken burrito" => 0.68,
      "beef burrito" => 3.81,
      "rice" => 4.00,
      "flavored beverage" => 0.22,
      "bottled water" => 0.16,
      "potato chips" => 0.075,
    }

    kind = self.kind.downcase


    if cost.to_i == 0
        (cost.delete('$').to_f/(unit_cost_kind[kind]) * (unit_emission_kind[kind])).round(3)
    else  (cost.to_f/(unit_cost_kind[kind]) * (unit_emission_kind[kind])).round(3)
    end
  end 

end


# make it look nicer

# store user id with each Receipt
# show user's Receipts on home page when they log in
# require logged in user to do things with Receipts

# later...
# allow saving more than just electricity
