class Receipt < ActiveRecord::Base
  attr_accessible :kind, :cost, :user_id, :date, :emission

  belongs_to :user
  belongs_to :interval

  # validates_inclusion_of :kind, in: KINDS.keys

  KINDS = {
    #Categories we care about from by Intuit:
    "gas & fuel" => { cost: 4.00 , emission: 12.6 },
    "public transportation" => { cost: 2.50 , emission: 1.5 },
    "utilities" => { cost: 0.16 , emission: 2.0 },
    "groceries" => { cost: 1.00 , emission: 0.62 },
    "coffee shops" => { cost: 1.00 , emission: 0.1 },
    #meat
    "fast food" => { cost: 1.00 , emission: 1.0 },
    #meat
    "restaurants" => { cost: 1.00 , emission: 1.0 },
    "alcohol & bars" => { cost: 3.00 , emission: 0.5 },
    "clothing" => { cost: 1.00 , emission: 0.225 },
    "books" => { cost: 15.00 , emission: 1.0 },
    "electronics & software" => { cost: 1.00 , emission: 0.5 },
    "air travel" => { cost: 1.00 , emission: 5.0 },
    "hotel" => { cost: 1.00 , emission: 0.27 },
    "rental car & taxi" => { cost: 2.00 , emission: 0.85 },
    "shopping" => { cost: 1.00 , emission: 0.2 },
  }

  after_create :upsert_interval_status

  def calculate_emission
    logger.info "****** CALCULATE EMISSION *******"
    # # if there was a kind in the Constant then set the cost and emission otherwise make them 0
      # logger.info "self.kind = #{self.kind}"
      # logger.info "unit_cost_kind= #{KINDS[kind][:cost]}"
      # logger.info "unit_emission_kind = #{KINDS[kind][:emission]}"
      # if self.kind != nil
      kind = self.kind.downcase
      logger.info "---> kind = #{kind}"
      logger.info ""
    if KINDS[kind] != nil
      logger.info "---> Kind exists"
      unit_cost_kind = KINDS[kind][:cost]
      unit_emission_kind = KINDS[kind][:emission]
      logger.info "unit_emission_kind = #{kind}"
      logger.info "---> COST IS NOT 0 ---> #{self.cost}"
      self.emission = (cost.to_f / unit_cost_kind * unit_emission_kind).round(3)
    else
      logger.info "---> Kind does not exist"
      unit_cost_kind = 1
      unit_emission_kind = 1
      self.emission = 0.0
    end
      logger.info ""
      logger.info ""
      logger.info ""
      # logger.info "After Receipt interval inspection::::#{@interval.inspect}"
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

