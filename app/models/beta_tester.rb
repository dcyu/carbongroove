class BetaTester < ActiveRecord::Base
  attr_accessible :email, :name

  validates :email, :format => /@/
  validates :password, :length => 5..20
  validates_presence_of :email
  validates_uniqueness_of :email

end
