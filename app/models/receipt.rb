class Receipt < ActiveRecord::Base
  attr_accessible :kind, :cost, :user_id

  def emission
    unit_cost_kind = Hash.new
    unit_cost_kind = {
      "electricity" => 0.155,
      "gasoline" => 4.00,
      "computer" => 1300.00,
      "cheeseburger" => 7.00,
    }

    unit_emission_kind = Hash.new
    unit_emission_kind = {
      "electricity" => 0.527,
      "gasoline" => 12.60,
      "computer" => 720.00,
      "cheeseburger" => 2.50,
    }

    kind = self.kind.downcase


    cost.to_i/(unit_cost_kind[kind]) * (unit_emission_kind[kind])
  end     
end


# make it look nicer

# store user id with each Receipt
# show user's Receipts on home page when they log in
# require logged in user to do things with Receipts

# later...
# allow saving more than just electricity
