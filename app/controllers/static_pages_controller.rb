class StaticPagesController < ApplicationController
  def home

  	# if logged_in?
  	#  	@micropost  = current_user.microposts.build
   #   	@feed_items = current_user.feed.paginate(page: params[:page], per_page: 15)
  	# end
    #@stocks = StockQuote::Stock.quote(["optt", "dcix", "esea", "ship","drys"])

    @stocks = UserStock.select("stock_id, count(user_id) AS c").
              group('stock_id').order("c ASC").limit(5)


    # Query to get top 5 most popular stock amongst all the user in the UerStock table
    @stocks = UserStock.select("stock_id, count(user_id) AS c").group('stock_id').order("c ASC").limit(5)

    @trending =[]
    @stock_for_user = []

    # Check to see if the value from the query is nil
    if @stocks.nil?
        stock_for_user = nil;

    else
      # Extract the stock id from the query
      @stocks.each do |stock|
        @trending << stock["stock_id"]
      end
      # Create an array of the values that we want using the stock_id
      @trending.each do |trend|
        @stock_for_user << Stock.where(id: trend).
        select(:name, :symbol, :current_price, :amount_change, :percent_change)
      end
    end

    # Using feedjira to grab RSS feed from cnn money market
    @feed = FeedEntry.update_from_feed("http://rss.cnn.com/rss/money_markets.rss")

    # Additional URL to pull RSS feed from
    #http://www.investing.com/rss/stock.rss
    #http://rss.cnn.com/rss/money_markets.rss

    # Display the most recent 5 article from the RSS feed
    @feed = FeedEntry.all().order('published_at desc').limit(5)


    if logged_in?
      @user_stocks = current_user.stocks
      @user = current_user
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
