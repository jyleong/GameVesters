# README

CMPT 470 Group 1's Final project

## Gamevesters (tentative title)

By:
    James Leong
    Riku Kenju
    Carlson Chan
    Tyler Wong
    Eric Liu

to run app in development mode

navigate to ./Final_Project

----------------------------------------------------

**Notes for seeding database:**

clear initial db by
rails db:migrate:reset

this resets db under db/seeds.rb

----------------------------------------------------
**to run in regular development mode (our own work/testing)**

clear db
seed db

rails db:seed

rails s <- start server

----------------------------------------------------
### FOR CHECKPOINT SUBMISSION
To run in Vagrant Development Mode

run
$vagrant up

to be sane run
$Vagrant provision

this will run vagrant installing and setting up the virtual machine,
this will seed the database and everything else as a admin user

your user email and password are:

user email: Admin.user@gmail.com
Password: Password1

go to browser and open up localhost:3000

----------------------------------------------------

### CHECKPOINT SUBMISSION TASKS FLOWS AND FEATURES TO ASSESS
**All currencies are virtual and does no have any connections to real dollars**

New user creation
- create new user with any email
- default currency will be given at 100,000

Search stocks by symbol
- example symbols => 'goog', 'aapl', 'yhoo'

Add stocks to your portfolio
- after searching for a stock (by symbol) click the 'add' button to add it to your portfolio
- added stocks will be displayed in your "Profile???" page for you to have quick glance over basic stats

(Daily) login rewards
- currently, for demo pruposes, all users will be awarded 20,000 everytime they login. In final version this will be once every 24 hours

Daily challenge questions
- answer some random trading related questions for additional rewards!

See trending stocks on Home page
- 5 most trending stokcs will be displayed on Home page

Follow other users
- you can follow other users to see how they are doing and learn their trading behavior

Notification System
- Back-end and polling is done, but no actual messages being sent out yet
- Front-end is in place for viewing

Buy/Sell stocks
- users can make trasactions when buying or selling stocks using their virtual currency


----------------------------------------------------

If wanting to deploy production mode:

When migrating (or doing other management commands), make sure you specify production mode:

rake db:migrate RAILS_ENV=production

----------------------------------------------------

### FOR DEV WORK AND COMMITS

** We will have a master branch and a development branch

we will merge to development first before updating the master for our final project

do this by

pulling initial repo then
$git fetch

*this updates your local with our remote

make your own branch from here as stated in step 1)

1) everyone works on their own branch
  start a branch by
  $git checkout -b <yourbranchname>

2) commit and add changes to your own branch
  $git add -A
  $git commit -am <commit message>
  $git push

3) to merge
  follow practice like in real sw engineering
  make pull requests to merge to our dev branch
  others to review code before merging


