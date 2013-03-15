User.destroy_all
RegularUser.create([{name: "Shay", email: "shay@starterleague.com", password: "carbon", pic_url: "http://www.starterleague.com/assets/shay-howe.jpg" }])

seed_receipts = [
# 02-01
  { :kind => "meat sandwich",
    :date => Date.parse("01/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "12.50"
  },
  { :kind => "banana",
    :date => Date.parse("01/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => ".90"
  },
  { :kind => "public transportation",
    :date => Date.parse("01/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "5.50"
  },

  # 02-02
  { :kind => "beef burrito",
    :date => Date.parse("02/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "5.50"
  },
  { :kind => "bottled water",
    :date => Date.parse("02/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.00"
  },

  # 02-03
  { :kind => "flavored beverage",
    :date => Date.parse("03/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.50"
  },
  { :kind => "gasoline",
    :date => Date.parse("03/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "65.20"
  },
  { :kind => "potato chips",
    :date => Date.parse("03/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.29"
  },
  { :kind => "bottled water",
    :date => Date.parse("03/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.20"
  },

  # 02-04
  { :kind => "cheeseburger",
    :date => Date.parse("04/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "6.90"
  },
  { :kind => "bottled water",
    :date => Date.parse("04/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.20"
  },
  { :kind => "electricity",
    :date => Date.parse("04/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "17.54"
  },
  { :kind => "rice",
    :date => Date.parse("04/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "7.54"
  },

  # 02-05
  { :kind => "banana",
    :date => Date.parse("05/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => ".90"
  },
  { :kind => "computer",
    :date => Date.parse("05/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "410.00"
  },
  { :kind => "gasoline",
    :date => Date.parse("05/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "65.20"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("05/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.99"
  },

  # 02-06
  { :kind => "veggie sandwich",
    :date => Date.parse("06/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "7.50"
  },
  { :kind => "banana",
    :date => Date.parse("06/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.20"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("06/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.90"
  },
  { :kind => "shopping",
    :date => Date.parse("06/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "89.90"
  },

  # 02-07
  { :kind => "beef burrito",
    :date => Date.parse("07/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "7.50"
  },
  { :kind => "chicken burrito",
    :date => Date.parse("07/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "6.53"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("07/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.98"
  },

  # 02-08
  { :kind => "beef burrito",
    :date => Date.parse("08/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "5.44"
  },
  { :kind => "corn chips",
    :date => Date.parse("08/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.46"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("08/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.96"
  },
  { :kind => "fast food",
    :date => Date.parse("08/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "22.90"
  },
  { :kind => "clothing",
    :date => Date.parse("08/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "79.90"
  },

  # 02-09
  { :kind => "cheeseburger",
    :date => Date.parse("09/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "4.56"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("09/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.23"
  },
  { :kind => "french fries",
    :date => Date.parse("09/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.77"
  },
  { :kind => "hotel",
    :date => Date.parse("09/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "99.00"
  },

  # 02-10
  { :kind => "gasoline",
    :date => Date.parse("10/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "47.50"
  },
  { :kind => "chicken burrito",
    :date => Date.parse("10/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "7.50"
  },
  { :kind => "rice",
    :date => Date.parse("10/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.20"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("10/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.99"
  },

  # 02-11
  { :kind => "meat sandwich",
    :date => Date.parse("11/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "12.50"
  },
  { :kind => "banana",
    :date => Date.parse("11/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => ".90"
  },
  { :kind => "public transportation",
    :date => Date.parse("11/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "5.50"
  },

  # 02-12
  { :kind => "beef burrito",
    :date => Date.parse("12/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "5.50"
  },
  { :kind => "bottled water",
    :date => Date.parse("12/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.00"
  },
  { :kind => "restaurants",
    :date => Date.parse("12/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "23.00"
  },

  # 02-13
  { :kind => "flavored beverage",
    :date => Date.parse("13/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.50"
  },
  { :kind => "gasoline",
    :date => Date.parse("13/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "65.20"
  },
  { :kind => "potato chips",
    :date => Date.parse("13/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.29"
  },
  { :kind => "bottled water",
    :date => Date.parse("13/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.20"
  },

  # 02-14
  { :kind => "cheeseburger",
    :date => Date.parse("14/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "6.90"
  },
  { :kind => "bottled water",
    :date => Date.parse("14/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.20"
  },
  { :kind => "rental car & taxi",
    :date => Date.parse("14/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "89.90"
  },
  { :kind => "rice",
    :date => Date.parse("14/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "7.54"
  },

  # 02-15
  { :kind => "banana",
    :date => Date.parse("15/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => ".90"
  },
  { :kind => "books",
    :date => Date.parse("15/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "49.50"
  },
  { :kind => "gasoline",
    :date => Date.parse("15/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "23.20"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("15/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.99"
  },

  # 02-16
  { :kind => "veggie sandwich",
    :date => Date.parse("16/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "7.50"
  },
  { :kind => "banana",
    :date => Date.parse("16/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.20"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("16/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.90"
  },
  { :kind => "shopping",
    :date => Date.parse("16/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "89.90"
  },

  # 02-17
  { :kind => "chicken burrito",
    :date => Date.parse("17/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "6.53"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("17/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.98"
  },

  # 02-18
  { :kind => "beef burrito",
    :date => Date.parse("18/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "5.44"
  },
  { :kind => "corn chips",
    :date => Date.parse("18/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.46"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("18/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.96"
  },
  { :kind => "fast food",
    :date => Date.parse("18/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "22.90"
  },
  { :kind => "clothing",
    :date => Date.parse("18/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "12.90"
  },

  # 02-19
  { :kind => "cheeseburger",
    :date => Date.parse("19/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "4.56"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("19/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.23"
  },
  { :kind => "french fries",
    :date => Date.parse("19/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.77"
  },
  { :kind => "hotel",
    :date => Date.parse("19/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "99.00"
  },

  # 02-20
  { :kind => "gasoline",
    :date => Date.parse("20/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "47.50"
  },
  { :kind => "chicken burrito",
    :date => Date.parse("20/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "7.50"
  },
  { :kind => "rice",
    :date => Date.parse("20/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.20"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("20/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.99"
  },

  # 02-21
  { :kind => "flavored beverage",
    :date => Date.parse("21/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.50"
  },
  { :kind => "gasoline",
    :date => Date.parse("21/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "65.20"
  },
  { :kind => "potato chips",
    :date => Date.parse("21/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.29"
  },
  { :kind => "bottled water",
    :date => Date.parse("21/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.20"
  },

  # 02-22
  { :kind => "banana",
    :date => Date.parse("22/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => ".90"
  },
  { :kind => "books",
    :date => Date.parse("22/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "49.50"
  },
  { :kind => "gasoline",
    :date => Date.parse("22/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "23.20"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("22/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.99"
  },

  # 02-23
  { :kind => "flavored beverage",
    :date => Date.parse("23/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.50"
  },
  { :kind => "gasoline",
    :date => Date.parse("23/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "65.20"
  },
  { :kind => "potato chips",
    :date => Date.parse("23/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.29"
  },
  { :kind => "bottled water",
    :date => Date.parse("23/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.20"
  },

  # 02-24
  { :kind => "chicken burrito",
    :date => Date.parse("24/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "6.53"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("24/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.98"
  },

  # 02-25
  { :kind => "beef burrito",
    :date => Date.parse("25/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "5.50"
  },
  { :kind => "bottled water",
    :date => Date.parse("25/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.00"
  },
  { :kind => "restaurants",
    :date => Date.parse("25/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "23.00"
  },

  # 02-26
  { :kind => "flavored beverage",
    :date => Date.parse("26/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.50"
  },
  { :kind => "gasoline",
    :date => Date.parse("26/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "65.20"
  },
  { :kind => "potato chips",
    :date => Date.parse("26/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.29"
  },
  { :kind => "bottled water",
    :date => Date.parse("26/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.20"
  },

  # 02-27
  { :kind => "flavored beverage",
    :date => Date.parse("27/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.50"
  },
  { :kind => "gasoline",
    :date => Date.parse("27/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "65.20"
  },
  { :kind => "potato chips",
    :date => Date.parse("27/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.29"
  },
  { :kind => "bottled water",
    :date => Date.parse("27/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.20"
  },

  # 02-28
  { :kind => "beef burrito",
    :date => Date.parse("08/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "5.44"
  },
  { :kind => "corn chips",
    :date => Date.parse("08/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.46"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("08/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.96"
  },
  { :kind => "fast food",
    :date => Date.parse("28/02/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "22.90"
  },

  # 03-01
  { :kind => "banana",
    :date => Date.parse("01/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => ".90"
  },
  { :kind => "alcohol & bars",
    :date => Date.parse("01/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "49.00"
  },
  { :kind => "gasoline",
    :date => Date.parse("01/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "34.20"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("01/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.99"
  },
  { :kind => "fast food",
    :date => Date.parse("01/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "22.90"
  },

  # 03-02
  { :kind => "beef burrito",
    :date => Date.parse("02/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "7.44"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("02/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.50"
  },
  { :kind => "potato chips",
    :date => Date.parse("02/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.29"
  },
  { :kind => "bottled water",
    :date => Date.parse("02/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.20"
  },

  # 03-03
  { :kind => "beef burrito",
    :date => Date.parse("03/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "5.44"
  },
  { :kind => "corn chips",
    :date => Date.parse("03/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.46"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("03/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.96"
  },
  { :kind => "fast food",
    :date => Date.parse("03/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "22.90"
  },

  # 03-04
  { :kind => "cheeseburger",
    :date => Date.parse("04/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "6.90"
  },
  { :kind => "bottled water",
    :date => Date.parse("04/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.20"
  },
  { :kind => "rental car & taxi",
    :date => Date.parse("04/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "89.90"
  },
  { :kind => "rice",
    :date => Date.parse("04/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "7.54"
  },

  # 03-05
  { :kind => "banana",
    :date => Date.parse("05/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => ".90"
  },
  { :kind => "books",
    :date => Date.parse("05/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "49.50"
  },
  { :kind => "gasoline",
    :date => Date.parse("05/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "23.20"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("05/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.99"
  },

  # 03-06
  { :kind => "gasoline",
    :date => Date.parse("06/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "47.50"
  },
  { :kind => "chicken burrito",
    :date => Date.parse("06/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "7.50"
  },
  { :kind => "rice",
    :date => Date.parse("06/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.20"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("06/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "1.99"
  },
  { :kind => "corn chips",
    :date => Date.parse("06/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "3.99"
  },

  # 03-07
  { :kind => "cheeseburger",
    :date => Date.parse("07/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "4.56"
  },
  { :kind => "flavored beverage",
    :date => Date.parse("07/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.23"
  },
  { :kind => "french fries",
    :date => Date.parse("07/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "2.12"
  },
  { :kind => "hotel",
    :date => Date.parse("07/03/2013"),
    :user_id => User.find_by_email("shay@starterleague.com").id,
    :cost => "79.00"
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
  # puts "do date for receipt:: #{receipt.date}"
  # puts "do user_id for receipt:: #{receipt.user_id}"
  # puts "do interval_id for receipt:: #{receipt.interval_id}"
  # puts "INTERVAL COUNT IS:::: #{Interval.count}"
  search_interval_result = Interval.where("start_range = ? AND user_id = ?", receipt.date, receipt.user_id ).limit(1)

  # puts "class #{search_interval_result.class}"
  # puts "empty? #{search_interval_result.empty?}"
  # puts "blank? #{search_interval_result.blank?}"
  # puts "!!!!!! #{search_interval_result.inspect}"

  if search_interval_result.blank?
    # puts "==============================================="
    # puts "NO INTERVAL FOR THIS DATE, MAKE ONE!"
    i = Interval.new
    i.start_range = receipt.date
    i.total_emission = receipt.emission
    i.user_id = receipt.user_id
    i.save
    # puts i.start_range
    # puts receipt.date
    # puts i.user_id
    # puts i
    # puts "now blank? #{i.blank?}"
    # puts "interval id ----------> #{i.id}"
    # save the interval id back to the receipt
    receipt.interval_id = i.id
    receipt.save
    # puts "receipt interval id ----------> #{receipt.interval_id}"
    # puts "==============================================="
    intervals_created << i
  else
    # puts "+++++++++++++++++++++++++++++++++++++++++++++++"
    # puts "YES, WE HAVE AN INTERVAL FOR THIS DATE!"
    # puts "YES!!!!!! #{search_interval_result.class}"
    existing_interval = search_interval_result.first
    # puts "YES!!!!!! #{existing_interval.class}"
    existing_interval.total_emission = (existing_interval.total_emission.to_d + receipt.emission.to_d).round(2).to_s
    # puts "TOTAL EMISSION YES!!!!!! #{existing_interval.total_emission}"
    existing_interval.save
    # save the interval id back to the receipt
    receipt.interval_id = existing_interval.id
    receipt.save
    # puts "receipt interval id ----------> #{receipt.interval_id}"
    # puts "+++++++++++++++++++++++++++++++++++++++++++++++"
  end
end
# puts intervals_created.count


# puts "These users and passwords have been created:
# name: Dave with shay@starterleague.com  \nname: Celine with celine.ui@gmail.com \nname: Daniel with dcyu93@carbongroove.com \nname: Namkyu with namkyuryoo@carbongroove.com \nthey all have \'carbon\' as the password."

puts "This user and password has been created: Shay with shay@starterleague.com  \'carbon\' as the password."





