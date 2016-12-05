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
**Disclaimer: All currencies are virtual and are not to be confused with real dollars**


# 1. User

## 1.1 New user creation

- Create a new user with any valid email Activate account by email verification.
- Password reset feature is functional.
- New user will be given 100,000 rubies along with the daili login bonus when logging in first time.

## 1.2 Users page
```
/users
```

- Search an existing user by their name
- Admin users can block other users to prevent them from loggin in or do any other activities.

## 1.3 User's own account

![alt text][profile-dropdown]


- Profile page contains tracked stocks, progress chart, folling/followers, currency
- Transactions page contains past transactions made (buying/selling stocks)
- My Portfolio page contains information shown to other users (your tracked stocks are publicly viewable by other users)
-Setting page contains functions to change password, email, name, and avatar(through gravatar)

## 1.4 See other user's tracked stocks

- Navigate to another user's profile page by clicking their name in the users page.
- Their tracked stocks will be displayed.
- Other users' currency is sensitive information and is hidden.

## 1.5 Follow other users
- You can follow other users to see how they are doing and learn their trading behavior.
- To follow a user, go to Users page, and search for a particular user or select one from the list.
- Click on the user name and jump to their public profile page.
- Click the big blue 'Follow' button to follow them.

# 2. Stock

## 2.1 Search stocks by symbol

- The top navigation bar contains a searchbox for searching a specific stock information.
- Check various stock information by searching with official symbol.
- Search is only available through symbols.
- example symbols => 'goog', 'aapl', 'yhoo'

## 2.2 Add stocks to your portfolio (track stocks)

- You can track the stock you are interested by clicking the 'Track' button.

![alt text][track-tut]


- the stocks just added will be displayed on Home page above trending stocks.
- you can buy/sell or untrack stocks by clicking the correspoding buttons.

![alt text][tracked-home]


- added stocks will also be displayed in your "My Profile" page for you to have quick glance over basic stats.

![alt text][tracked-profile]


## 2.3 Trending Tickers

- Top 5 most tracked stocks are shown on the Home page as tickers.
- The list refreshes with every page load

![alt text][trending]


## 2.4 Buy/Sell stocks
- Users can make transactions when buying or selling stocks using their virtual currency.
- To make transactions users can click the buy/sell button on their tracked stocks.
- A popup for buying/selling will be displayed as follows:

![alt text][transaction]


- Adjust the ammount and click 'Make Transaction'.
- Flash message will appear comfirming the transaction (if successful).
- Error messages will be displated in the popup if illegal transaction amount is entered.

- After making a transaction, the record will be kept in the Transactions page

![alt text][history]

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
