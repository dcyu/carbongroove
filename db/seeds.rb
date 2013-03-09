User.destroy_all
RegularUser.create([{name: "Dave", email: "workalicious@gmail.com", password: "carbon"},
                    {name: "Kaplan", email: "kaplan@workalicious.com", password: "carbon"},
                    {name: "Celine", email: "celine.ui@gmail.com", password: "carbon"},
                    {name: "Daniel", email: "dcyu93@carbongroove.com", password: "carbon"},
                    {name: "Namkyu", email: "namkyuryoo@carbongroove.com", password: "carbon"}
                    ])

seed_receipts = [
  # DAVE USER
  { :kind => "electricity",
    :date => Date.parse("01/03/2013"),
    # :date => Date.parse("01/03/2013").strftime("%Y-%m-%d"),
    :user_id => User.find_by_email("workalicious@gmail.com").id,
    :cost => "170.50"
  },
  { :kind => "banana",
    :date => Date.parse("01/03/2013"),
    :user_id => User.find_by_email("workalicious@gmail.com").id,
    :cost => ".90"
  },
  { :kind => "beef burrito",
    :date => Date.parse("01/03/2013"),
    :user_id => User.find_by_email("workalicious@gmail.com").id,
    :cost => "5.50"
  },
  { :kind => "computer",
    :date => Date.parse("01/03/2013"),
    :user_id => User.find_by_email("workalicious@gmail.com").id,
    :cost => "1200"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("03/03/2013"),
    :user_id => User.find_by_email("workalicious@gmail.com").id,
    :cost => "2.50"
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

receipts_created = Array.new
Receipt.destroy_all
seed_receipts.each do |receipt|
  r = Receipt.new
  r.kind = receipt[:kind]
  r.date = receipt[:date]
  r.user_id = receipt[:user_id]
  r.cost = receipt[:cost]
  r.save
  receipts_created << r
end

Interval.destroy_all
intervals_created = Array.new
receipts_created.each do |receipt|
  puts "do date for receipt:: #{receipt.date}"
  puts "do user_id for receipt:: #{receipt.user_id}"
  puts "do interval_id for receipt:: #{receipt.interval_id}"
  puts "INTERVAL COUNT IS:::: #{Interval.count}"
  # search_interval_result = Interval.where("start_range = ? AND user_id = ?", receipt.date, receipt.user_id )
  search_interval_result = Interval.where("start_range = ? AND user_id = ?", receipt.date, receipt.user_id ).limit(1)

  puts "class #{search_interval_result.class}"
  puts "empty? #{search_interval_result.empty?}"
  puts "blank? #{search_interval_result.blank?}"
  puts "!!!!!! #{search_interval_result.inspect}"

  if search_interval_result.blank?
    puts "==============================================="
    puts "NO INTERVAL FOR THIS DATE, MAKE ONE!"
    i = Interval.new
    i.start_range = receipt.date
    i.total_emission = receipt.emission
    i.user_id = receipt.user_id
    i.save
    puts i.start_range
    puts receipt.date
    puts i.user_id
    puts i
    puts "now blank? #{i.blank?}"
    puts "interval id ----------> #{i.id}"
    # save the interval id back to the receipt
    receipt.interval_id = i.id
    receipt.save
    puts "receipt interval id ----------> #{receipt.interval_id}"
    puts "==============================================="
    intervals_created << i
  else
    puts "+++++++++++++++++++++++++++++++++++++++++++++++"
    puts "YES, WE HAVE AN INTERVAL FOR THIS DATE!"
    puts "YES!!!!!! #{search_interval_result.class}"
    existing_interval = search_interval_result.first
    puts "YES!!!!!! #{existing_interval.class}"
    existing_interval.total_emission = (existing_interval.total_emission.to_d + receipt.emission.to_d).round(3).to_s
    puts "TOTAL EMISSION YES!!!!!! #{existing_interval.total_emission}"
    existing_interval.save
    # save the interval id back to the receipt
    receipt.interval_id = existing_interval.id
    receipt.save
    puts "receipt interval id ----------> #{receipt.interval_id}"
    puts "+++++++++++++++++++++++++++++++++++++++++++++++"
  end
end
puts intervals_created.count


puts "These users and passwords have been created:
name: Dave with workalicious@gmail.com  \nname: Kaplan with kaplan@workalicious.com \nname: Celine with celine.ui@gmail.com \nname: Daniel with dcyu93@carbongroove.com \nname: Namkyu with namkyuryoo@carbongroove.com \nthey all have \'carbon\' as the password."






