User.destroy_all
RegularUser.create([{name: "Dave", email: "workalicious@gmail.com", password: "carbon"},
                    {name: "Kaplan", email: "kaplan@workalicious.com", password: "carbon"},
                    {name: "Celine", email: "celine.ui@gmail.com", password: "carbon"},
                    {name: "Daniel", email: "dcyu93@carbongroove.com", password: "carbon"},
                    {name: "Namkyu", email: "namkyuryoo@carbongroove.com", password: "carbon"}
                    ])

# kind_names = []
# kinds.each do |key, value|
#   kind_array << key.to_s
# end

receipts = [
  # DAVE USER
  { :kind => "electricity",
    :date => Date.parse("01/03/2013"),
    :user_id => User.find_by_email("workalicious@gmail.com").id,
    :cost => "173.54"
  },
  { :kind => "banana",
    :date => Date.parse("01/03/2013"),
    :user_id => User.find_by_email("workalicious@gmail.com").id,
    :cost => ".90"
  },
  { :kind => "computer",
    :date => Date.parse("03/03/2013"),
    :user_id => User.find_by_email("workalicious@gmail.com").id,
    :cost => "1200"
  },
  { :kind => "gasoline",
    :date => Date.parse("04/03/2013"),
    :user_id => User.find_by_email("workalicious@gmail.com").id,
    :cost => "65.20"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("04/03/2013"),
    :user_id => User.find_by_email("workalicious@gmail.com").id,
    :cost => "1.66"
  },

  # KAPLAN USER
  { :kind => "bottled water",
    :date => Date.parse("01/03/2013"),
    :user_id => User.find_by_email("kaplan@workalicious.com").id,
    :cost => "1.20"
  },
  { :kind => "cheeseburger",
    :date => Date.parse("02/03/2013"),
    :user_id => User.find_by_email("kaplan@workalicious.com").id,
    :cost => "6.90"
  },
  { :kind => "bottled water",
    :date => Date.parse("03/03/2013"),
    :user_id => User.find_by_email("kaplan@workalicious.com").id,
    :cost => "1.20"
  },

    # CELINE USER
  { :kind => "electricity",
    :date => Date.parse("01/03/2013"),
    :user_id => User.find_by_email("celine.ui@gmail.com").id,
    :cost => "173.54"
  },
  { :kind => "banana",
    :date => Date.parse("01/03/2013"),
    :user_id => User.find_by_email("celine.ui@gmail.com").id,
    :cost => ".90"
  },
  { :kind => "computer",
    :date => Date.parse("03/03/2013"),
    :user_id => User.find_by_email("celine.ui@gmail.com").id,
    :cost => "1200"
  },
  { :kind => "gasoline",
    :date => Date.parse("04/03/2013"),
    :user_id => User.find_by_email("celine.ui@gmail.com").id,
    :cost => "65.20"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("05/03/2013"),
    :user_id => User.find_by_email("celine.ui@gmail.com").id,
    :cost => "1.66"
  },
]

Receipt.destroy_all
receipts.each do |receipt|
  r = Receipt.new
  r.kind = receipt[:kind]
  r.date = receipt[:date]
  r.user_id = receipt[:user_id]
  r.cost = receipt[:cost]
  r.save
end

Interval.destroy_all



puts "a couple of users and receipts have been made."






