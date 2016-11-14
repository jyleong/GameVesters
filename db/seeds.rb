# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "James Leong",
             email: "james.leong94@gmail.com",
             admin: true,
             password:              "Password1",
             password_confirmation: "Password1",
             )

user1 = User.create!(name:  "Eric Liu",
             email: "007.ericliu@gmail.com",
             admin: true,
             password:              "Password1",
             password_confirmation: "Password1",
             )

user1.create_notification("This is an example notification!", "/");
user1.create_notification("This notification links to a user!", "/users/5");
user1.create_notification("All notifications start as unread.", "/");

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }