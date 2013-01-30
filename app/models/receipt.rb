class Receipt < ActiveRecord::Base
  attr_accessible :kind, :cost

#have a hash of each kind and its carbon output

# unit_cost_kind = Hash.new
# unit_cost_kind = {
#   "electricity" => "0.155"
# }
# @c = unit_cost_kind["electricity"]

# unit_emission_kind = Hash.new
# unit_emission_kind = {
#   "electricity" => "0.527"
# }
# @e = unit_emission_kind["electricity"]




  def emission
    unit_cost_kind = Hash.new
    unit_cost_kind = {
      "electricity" => 0.155
    }

    unit_emission_kind = Hash.new
    unit_emission_kind = {
      "electricity" => 0.527
    }

    # return unit_cost_kind["electricity"]
    cost.to_i/(unit_cost_kind["electricity"]) * (unit_emission_kind["electricity"])
  end     
end


# make it look nicer

# store user id with each Receipt
# show user's Receipts on home page when they log in
# require logged in user to do things with Receipts

# later...
# allow saving more than just electricity
