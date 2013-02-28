class Receipt < ActiveRecord::Base
  attr_accessible :kind, :cost, :user_id, :date, :emission

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
    "potato chips" => { cost: 1.00 , emission: 0.075 },
    "corn chips" => { cost: 1.00 , emission: 0.075 }
  }


  def self.for_month(year, month)
    start_date = Time.new(year.to_i, month.to_i).to_datetime
    end_date = start_date.end_of_month
    #self.class.where("date >= #{start_date} AND date <= #{end_date}")--after user authentication is done, this should work.
    where("date >= ? AND date <= ?", start_date, end_date).order('date desc')
  end

  def emission

    kind = self.kind.downcase || "undefined"


  after_create :calculate_emission

  def calculate_emission
    logger.info "self.kind = #{self.kind}"
    logger.info "unit_cost_kind= #{KINDS[kind][:cost]}"
    logger.info "unit_emission_kind = #{KINDS[kind][:emission]}"
    kind = self.kind.downcase
    unit_cost_kind = KINDS[kind][:cost]
    unit_emission_kind = KINDS[kind][:emission]
    if cost.to_i == 0
      self.emission = (cost.delete('$').to_f/unit_cost_kind * unit_emission_kind).round(3)
    else
      self.emission = (cost.to_f/unit_cost_kind * unit_emission_kind).round(3)
    end
    self.save
  end

end
