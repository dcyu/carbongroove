class Goal < ActiveRecord::Base
  attr_accessible :description, :end_time, :goal_name, :start_time, :status, :user_id, :target_emission

  belongs_to :user
  has_many :receipts
  belongs_to :interval

  validates_presence_of :goal_name

  TARGET_GOAL = {
    "5%" => 0.95,
    "10%" => 0.90,
    "15%" => 0.85,
    "20%" => 0.80,
    "25%" => 0.75,
    "30%" => 0.70,
    "35%" => 0.65,
    "40%" => 0.60,
    "45%" => 0.55,
    "50%" => 0.50,
    "55%" => 0.45,
    "60%" => 0.40,
    "65%" => 0.35,
    "70%" => 0.30,
    "75%" => 0.25,
    "80%" => 0.20,
    "85%" => 0.15,
    "90%" => 0.10,
    "95%" => 0.05,
    "100%" => 0.0
}

  before_save :check_interval_status

  def check_interval_status
    logger.info "New inteval check for GOOOAAAAL!!!!!"
    logger.info "-------> #{self.start_time}"

    Interval.check_interval_for_goal(user, self)

  end

end
