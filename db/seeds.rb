# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "UserName Username",
             email: "fakeadminUser@gmail.com",
             admin: true,
             password:              "Password1",
             password_confirmation: "Password1",
             currency: 200000,
             activated: true,
             activated_at: Time.zone.now,
             percent_increase: BigDecimal.new(1.0, 0),
             current_net_worth: BigDecimal.new(100000.0, 0)
             )

user1 = User.create!(name:  "Eric Liu",
             email: "007.ericliu@gmail.com",
             admin: true,
             password:              "Password1",
             password_confirmation: "Password1",
             currency: 200000,
             activated: true,
             activated_at: Time.zone.now,
             percent_increase: BigDecimal.new(9000.0, 0),
             current_net_worth: BigDecimal.new(12340000.0, 0)
             )
user2 = User.create!(name:  "Tyler Wong",
             email: "tylerwong333@gmail.com",
             admin: false,
             password:              "Password1",
             password_confirmation: "Password1",

             currency: 200000,
             activated: true,
             activated_at: Time.zone.now,
             percent_increase: BigDecimal.new((rand*25).round(2), 0),
             current_net_worth: BigDecimal.new(100230.0, 0)
             )

user1.create_notification("This is an example notification!", "/");
user1.create_notification("This notification links to a user!", "/users/5");
user1.create_notification("All notifications start as unread.", "/");

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  percent_increase = BigDecimal.new(rand*25, 0)
  percent_increase = '%.2f' % percent_increase
  net_worth = BigDecimal.new(rand*12500, 0)
  net_worth = '%.2f' % net_worth
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               currency: 200000,
               activated: true,
               activated_at: Time.zone.now,
               percent_increase: BigDecimal.new(percent_increase, 0),
               current_net_worth: BigDecimal.new(net_worth, 0)
               )
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


Stock.create(symbol: "WIFI", name: "Boingo Wireless, Inc.",current_price: 11.37, amount_change: 0.45)
Stock.create(symbol:"AAPL", name: "Apple Inc.", current_price: 105.35, amount_change: 1.34)
Stock.create(symbol:"OPTT", name: "Ocean Power Technologies, Inc.", current_price: 3.2377, amount_change: -0.23)
Stock.create(symbol: "SBUX", name: "Starbucks Corporation", current_price: 57.65, amount_change: -0.86)
Stock.create(symbol: "TSLA", name: "Tesla Motors, Inc.", current_price: 196.12, amount_change: 4.32)


Question.create(qid:  "1",
             reward: 1000,
             content: "The answer is A",
             ans1: "abcd",
             ans2: "efgh",
             ans3: "ijkl",
             ans4: "mnop",
             answer: "a"
             )
Question.create(qid:  "2",
             reward: 1000,
             content: "The answer is B",
             ans1: "ahahaa ",
             ans2: "Pick this",
             ans3: "ajajajaja",
             ans4: "business",
             answer: "b"
             )
Question.create(qid:  "3",
             reward: 1000,
             content: "The answer is C",
             ans1: "Password1",
             ans2: "Password1",
             ans3: "correct answer",
             ans4: "Password1",
             answer: "c"
             )

