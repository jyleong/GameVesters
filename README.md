# README

CMPT 470 Group 1's Final project

## Gamevesters

By:
    James Leong
    Riku Kenju
    Carlson Chan
    Tyler Wong
    Eric Liu

**Quick Start**

Navigate to ./Final_Project
Start the VM by:

```
$vagrant up
```

After VM is running go to your browser and navigate to ```localhost:8080```

You can login as the default admin user:
```
fakeadminUser@gmail.com
```

```
Password1
```

Or go ahead and create a normal user by clicking the 'Sign up' button.


# Main Features
**Disclaimer: Do not confuse the currency "Rubies" with real money**


# 1. User

## 1.1 New user creation

- Create a new user with any valid email.
- Activate account by email verification.
- Password reset feature is functional.
- New user will be given 100,000 rubies when they first log in. Additional rubies can be gained from daily login.

## 1.2 Users page
```
/users
```

- Search an existing user by their name
- Admins have the ability to block users and prevent them from logging in or perform any other activities.

## 1.3 User's own account

![alt text][profile-dropdown]


- Profile page contains tracked stocks, progress chart, following/followers, and currency
- Transactions page contains past transactions made which includes buying and selling stocks
- My Portfolio page contains information shown to other users (your tracked stocks are publicly viewable by other users)
- Setting page contains functions to change password, email, name, and avatar(through gravatar)

## 1.4 See other user's tracked stocks

- Navigate to other user profile page by clicking their name in the users page.
- Their tracked stocks will be displayed.
- Other users' currency is hidden because it is sensitive information.

## 1.5 Follow other users
- You can follow other users to see how they are doing and learn their trading behavior.
- To follow a user, go to Users page and search for a particular user or select one from the list.
- Click on the user name and that will bring you to their public profile page.
- Click the big blue 'Follow' button to follow them.

# 2. Stock

## 2.1 Search stocks by symbol

- The navigation bar contains a search box for searching a specific stock for information.
- Search is only available through official symbols.
- example symbols => 'goog', 'aapl', 'yhoo'
- Various stocks information will be displayed by searching with the official symbol


## 2.2 Add stocks to your portfolio (track stocks)

- You can track the stocks you are interested in by clicking the 'Track' button.
- The stocks you track will be shown on the Home page above trending stocks.
- Tracked stocks will be displayed in your "My Profile" page for you to have quick glance over basic statistics.


## 2.3 Trending Tickers

- Top 5 most tracked stocks are shown on the Home page as tickers.
- The list refreshes with every page load


## 2.4 Buy/Sell stocks
- Users can create transactions by buying or selling stocks using their virtual currency.
To create a transaction:
1. Click the buy/sell button on their tracked stocks
    a. A popup for buying/selling will be displayed
2. Adjust the amount of stocks you would like to buy/sell
3. Click 'Make Transaction'
    a. Pop-up message will appear confirming the transaction (if successful)
    b. Error messages will be displayed in the popup if illegal transaction amount is entered
4. After making a transaction, the record will be kept in the Transactions page


# 3. Other

## 3.1 Daily Currency Bonuses

- The daily bonuses are a way to keep the user flowing, even if they run out of the virtual currency.

### 3.1.1 Login Bonus

- currently, for demo purpose, all users will be awarded 20,000 everytime they login. This is to demostrate the daily bonus feature easily.

### 3.1.2 Daily Challenge Questions

- You can answer a financial/stock related question once per day to receive additional currency bonus.
- Click the light blue button at the bottom left to answer a question for bonus.


![alt text][question-button]

## 3.2 Notification System

- You will recieve notifications about:
* A user followed you
* You have new bonus questions available

- To test this feature you can follow the user Eric Liu (as an example, any user would work)
- Then login as Eric (007.ericliu@gmail.com, Password1) and check the notifications

![alt text][notification]


[notification]: https://raw.githubusercontent.com/KenRiku/cmpt470_personal/master/notif.png "notification 1"
[question-button]: https://raw.githubusercontent.com/KenRiku/cmpt470_personal/master/question%20but.png "questions 1"
[history]: https://raw.githubusercontent.com/KenRiku/cmpt470_personal/master/trans.png "history 1"
[transaction]: https://raw.githubusercontent.com/KenRiku/cmpt470_personal/master/Screen%20Shot%202016-12-05%20at%203.05.03%20PM.png "buy sell popup 1"
[profile-dropdown]: https://raw.githubusercontent.com/KenRiku/cmpt470_personal/master/pro.png "account dropdown 1"
[track-tut]: https://raw.githubusercontent.com/KenRiku/cmpt470_personal/master/track.png "Track Stock Button 1"
[tracked-home]: https://raw.githubusercontent.com/KenRiku/cmpt470_personal/master/Screen%20Shot%202016-12-05%20at%202.25.44%20PM.png "Home with Tracked stock 1"
[tracked-profile]:https://raw.githubusercontent.com/KenRiku/cmpt470_personal/master/Screen%20Shot%202016-12-05%20at%202.31.02%20PM.png "Profile with tracked stock 1"
[trending]: https://raw.githubusercontent.com/KenRiku/cmpt470_personal/master/trending.png "trending tickers 1"
