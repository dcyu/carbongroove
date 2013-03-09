class Receipt < ActiveRecord::Base
  attr_accessible :kind, :cost, :user_id, :date, :emission

  belongs_to :user
  belongs_to :interval

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
    "potato chips" => { cost: 1.00 , emission: 0.075 },
    "corn chips" => { cost: 1.00 , emission: 0.075 },
    #Categories provided by Intuit:
    "Gas & Fuel" => { cost: 1.00 , emission: 1.0 },
    "Public Transportation" => { cost: 1.00 , emission: 1.0 },
    "Utilities" => { cost: 1.00 , emission: 1.0 },
    "Groceries" => { cost: 1.00 , emission: 1.0 },
    "Coffee Shops" => { cost: 1.00 , emission: 1.0 },
    "Fast Food" => { cost: 1.00 , emission: 1.0 },
    "Restaurants" => { cost: 1.00 , emission: 1.0 },
    "Alcohol & Bars" => { cost: 1.00 , emission: 1.0 },
    "Clothing" => { cost: 1.00 , emission: 1.0 },
    "Books" => { cost: 1.00 , emission: 1.0 },
    "Electronics & Software" => { cost: 1.00 , emission: 1.0 },
    "Air Travel" => { cost: 1.00 , emission: 1.0 },
    "Hotel" => { cost: 1.00 , emission: 1.0 },
    "Rental Car & Taxi" => { cost: 1.00 , emission: 1.0 }
  }

  after_create :upsert_interval_status

  def calculate_emission
    logger.info "****** CALCULATE EMISSION *******"
    logger.info "self.kind = #{self.kind}"
    logger.info "unit_cost_kind= #{KINDS[kind][:cost]}"
    logger.info "unit_emission_kind = #{KINDS[kind][:emission]}"
    kind = self.kind.downcase

    # if there was a kind in the Constant then set the cost and emission otherwise make them 0
    unit_cost_kind = KINDS[kind][:cost]
    unit_emission_kind = KINDS[kind][:emission]
    # else
    # unit_cost_kind = 0
    # unit_emission_kind = 0
    # end

  if cost.to_i == 0
    self.emission = (cost.delete('$').to_d/unit_cost_kind * unit_emission_kind).round(3)
  else
    self.emission = (cost.to_f/unit_cost_kind * unit_emission_kind).round(3)
  end
    logger.info "After Receipt interval inspection::::#{@interval.inspect}"
    # self.interval_id =
    self.save
  end


  def check_interval_status
    # @interval = Interval.new
    logger.info "****** CREATE INTERVAL IF NEEDED *******"
    logger.info "****** user.id: #{user.id.class} *******"
    logger.info "****** (receipt)self.user_id: #{self.user_id.class} *******"
    # logger.info "****** Session :user_id: #{session[:user_id]} *******"
    logger.info "****** USER: #{self.user} *******"
    logger.info "****** RECEIPT: #{self} *******"
    # @interval.input_interval_data(user)

    Interval.create_interval_if_needed(user, self)

    yo = Interval.do_something
    logger.info "****** END INTERVAL #{yo} *******"

  end



  private
  def upsert_interval_status
    calculate_emission
    check_interval_status
  end








end

