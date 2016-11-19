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

user email: fakeadminUser@gmail.com
Password: Password1

go to browser and open up localhost:3000

----------------------------------------------------

### CHECKPOINT SUBMISSION TASKS FLOWS AND FEATURES TO ASSESS
**Disclaimer: All currencies are virtual and are not to be confused with real dollars**

### Current Features

**New user creation**
- create new user with any email.
- default currency will be given at 100,000 for first time sign up.
- After first time sign in, you will land in your user page, click the 'Gamevesters' logo to navigate to Home

**Search stocks by symbol**
- currently user can only search stocks by their official symbol.
- example symbols => 'goog', 'aapl', 'yhoo'

- there are 2 ways to search stocks:
1. searhbar on the header
2. searchbar in the '/my_portfolio' path

**Add stocks to your portfolio (track stocks)**
- after searching for a stock (by symbol) click the 'Add to my Stocks' button to add it to your portfolio.
- the stocks just added will be displayed on Home page above trending stocks.
- added stocks will also be displayed in your "My Profile" page for you to have quick glance over basic stats.
- the added stocks will have the **'tracked'** status.

**(Daily) login rewards**
- currently, for demo purpose, all users will be awarded 20,000 everytime they login. In final version this will be once every 24 hours.

**Daily challenge questions**
- this is a planned feature, the back-end code is ready however no front-end is in place.

**See trending stocks on Home page**
- 5 most trending stokcs will be displayed on Home page.
- this information is currently being pulled from external site, in the final version we will display the top 5 stocks in user's tracked stocks.

**Follow other users**
- You can follow other users to see how they are doing and learn their trading behavior.
- To follow a user, go to Users page, and search for a particular user or select one from the list.
- Click on the user name and jump to their public profile page.
- Click the big blue 'Follow' button to follow them.
- In final version more information about the user will be displayed and some sensitive information will be hidden to other users.

**Notification System**
- Back-end and polling is done, but no actual messages being sent out yet.
- Notification system will be used for following status or followed users' buying/selling information.
- Front-end is in place for viewing on the top right hand corner.

**Buy/Sell stocks**
- Users can make transactions when buying or selling stocks using their virtual currency.
- To make transactions users can click the buy/sell button on their tracked stocks.
- A popup will show with a form to buy/sell the particular stock.
- Adjust the ammount and click 'Make Transaction'.
- Flash message will appear comfirming the transaction (if successful).
- Error messages will be displated in the popup if illegal transaction amount is entered.
- Final price will change based on the quantity, however not fully functional at this checkpoint.


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


