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

# Sample notifications
User.find_each do |user|
    user.create_notification("This is an example notification!", "/");
    user.create_notification("This notification links to a user!", "/users/5");
    user.create_notification("All notifications start as unread.", "/");
end

Stock.create(symbol: "WIFI", name: "Boingo Wireless, Inc.",current_price: 11.37, amount_change: 0.45)
Stock.create(symbol:"AAPL", name: "Apple Inc.", current_price: 105.35, amount_change: 1.34)
Stock.create(symbol:"OPTT", name: "Ocean Power Technologies, Inc.", current_price: 3.2377, amount_change: -0.23)
Stock.create(symbol: "SBUX", name: "Starbucks Corporation", current_price: 57.65, amount_change: -0.86)
Stock.create(symbol: "TSLA", name: "Tesla Motors, Inc.", current_price: 196.12, amount_change: 4.32)

# Seed net worth for users
UserHistoricDatum.update_users_net_worth

Question.create(qid:  "1",
             reward: 1000,
             content: "Which of the four investments has shown the highest returns historically?",
             ans1: "Real Estate",
             ans2: "Bonds",
             ans3: "Stocks",
             ans4: "Cash",
             answer: "c"
             )
Question.create(qid:  "2",
             reward: 1000,
             content: "Which feature do Exchange-Trade Funds (ETFs) have in common with mutual funds?",
             ans1: "They can be traded at any time",
             ans2: "They are tied to an index",
             ans3: "One investment purchases a group of assets",
             ans4: "They are both deliberately confusing",
             answer: "a"
             )
Question.create(qid:  "3",
             reward: 1000,
             content: "How is the term Beta used to understand stock data?",
             ans1: "It measures the change in stock price compared to yesterday's closing price",
             ans2: "It is a test to see if a stock will sell in the stock market",
             ans3: "It indicates the total shares outstanding multiplied by the current stock price",
             ans4: "It measures the volatility of a stock",
             answer: "d"
             )
Question.create(qid:  "4",
             reward: 1000,
             content: "What is the Sharpe Ratio Index?",
             ans1: "A measure of risk that helps you select the right stocks",
             ans2: "A way to spread out your stock sales",
             ans3: "A pen that helps you calculate stock prices",
             ans4: "A conservative way to purchase and sell stocks",
             answer: "a"
             )
Question.create(qid:  "5",
             reward: 1000,
             content: " What does technical analysis look at for investment purposes?",
             ans1: "A company's revenue growth",
             ans2: "A company's competition",
             ans3: "A company's profit margins",
             ans4: "The price at which the stock trades",
             answer: "d"
             )
Question.create(qid:  "6",
             reward: 1000,
             content: "What happens when an investor over-diversifies?",
             ans1: "They are spread too thin",
             ans2: "They make more money",
             ans3: "They drive their money manager crazy",
             ans4: "They create high-risk scenarios",
             answer: "c"
             )
Question.create(qid:  "7",
             reward: 1000,
             content: "What is implied volatility?",
             ans1: "A risk probability equation",
             ans2: "A measure of how risk could occur",
             ans3: "A calculation that compares the current market price and theoretical future value",
             ans4: "Something that only impacts option writers",
             answer: "c"
             )
Question.create(qid:  "8",
             reward: 1000,
             content: "What partially defines a Bull Market? ",
             ans1: "A positive outlook about the current business cycle",
             ans2: "Lack of investor confidence",
             ans3: "Stimulating energy drinks",
             ans4: "Low stock prices",
             answer: "a"
             )

listUsers = users[2..30]
listUsers.each {|n|

  UserStock.create(stock_id: 1, user_id: n.id)
  UserStock.create(stock_id: 2, user_id: n.id)
  UserStock.create(stock_id: 3, user_id: n.id)
  UserStock.create(stock_id: 4, user_id: n.id)
  UserStock.create(stock_id: 5, user_id: n.id)
}
