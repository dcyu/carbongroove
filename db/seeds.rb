# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = [
  { :email => "user_a@carbongroove.com",
    :

  },
  { :email => "user_a@carbongroove.com",

  }
]

receipts = [
  { :kind => "electricity",
    :date => Date.parse("18/02/2013"),
    :user_id => User.find_by_email("user@carbongroove.com").id,
    :cost => "173.54",
    :emission => number_with_delimiter(self.calculate_emission)
  },
  { :kind => "banana",
    :date => Date.parse("19/02/2013"),
    :user_id => User.find_by_email("user@carbongroove.com").id,
    :cost => ".90",
    :emission => number_with_delimiter(self.calculate_emission)
  }
]

Receipt.destroy_all
receipts.each do |receipt|
  r = Receipt.new
  r.kind = receipt[:kind]
  r.date = receipt[:date]
  r.user_id = receipt[:user_id]
  r.cost = receipt[:cost]
  r.emission = receipt[:emission]
  r.save
end







