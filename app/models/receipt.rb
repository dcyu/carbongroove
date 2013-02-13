class Receipt < ActiveRecord::Base
  attr_accessible :kind, :cost, :user_id

  belongs_to :user

  # validates_inclusion_of :kind, in: KINDS.keys

  KINDS = {
    "electricity" => { cost: 0.155, emission: 2 },
    "gasoline" => { cost: 4.00, emission: 12.6},
    "computer" => { cost: 1300.00, emission: 720.00 },
    "cheeseburger" => { cost: 7.00 , emission: 2.50 },
    "banana" => { cost: 1.00 , emission: 0.08 },
    "veggie sandwich" => { cost: 5.00 , emission: 0.40 },
    "meat sandwich" => { cost: 5.00 , emission: 0.80 },
    "chicken burrito" => { cost: 7.00 , emission: 0.68 },
    "beef burrito" => { cost: 7.00 , emission: 3.81 },
    "rice" => { cost: 4.00 , emission: 4.00 },
    "flavored beverage" => { cost: 2.00 , emission: 0.22 },
    "bottled water" => { cost: 1.00 , emission: 0.16 },
    "potato chips" => { cost: 1.00 , emission: 0.075 }
  }

  def emission

    kind = self.kind.downcase

    unit_cost_kind = KINDS[kind][:cost]
    unit_emission_kind = KINDS[kind][:emission]


    if cost.to_i == 0
        (cost.delete('$').to_f/unit_cost_kind * unit_emission_kind).round(3)
    else  (cost.to_f/unit_cost_kind * unit_emission_kind).round(3)
    end

  end 

end


# make it look nicer

# store user id with each Receipt
# show user's Receipts on home page when they log in
# require logged in user to do things with Receipts

# later...
# allow saving more than just electricity
