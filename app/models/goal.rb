class Goal < ActiveRecord::Base
  attr_accessible :description, :end_time, :goal_name, :start_time, :status, :user_id, :target_emission

  belongs_to :user

  validates_presence_of :goal_name

end
