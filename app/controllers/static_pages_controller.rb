class StaticPagesController < ApplicationController
  def home
  	# if logged_in?
  	#  	@micropost  = current_user.microposts.build
   #   	@feed_items = current_user.feed.paginate(page: params[:page], per_page: 15)
  	# end
    #@stocks = StockQuote::Stock.quote(["optt", "dcix", "esea", "ship","drys"])
    query = "SELECT * FROM (SELECT stock_id, count(user_id) FROM user_stocks GROUP BY stock_id) as new ORDER BY count(new.stock_id) ASC Limit 5"

    @stocks = ActiveRecord::Base.connection.execute(query)
    puts @stocks

    @trending =[]
    @stocks.each do |stock|
      @trending << stock["stock_id"]
        #@trending =  Stock.where(id: stock["stock_id"]).select(:symbol, :name, :current_price, :amount_change, :percent_change);
        #puts @trending

    end
    puts @trending
    @stock_for_user = []
    @trending.each do |trend|
      puts trend
      @stock_for_user << Stock.where(id: trend).select(:name, :symbol, :current_price, :amount_change, :percent_change)

    end

puts @stock_for_user
#binding.pry
    @feed = FeedEntry.update_from_feed("http://rss.cnn.com/rss/money_markets.rss")

    #http://www.investing.com/rss/stock.rss
    #http://rss.cnn.com/rss/money_markets.rss


    @feed = FeedEntry.all().order('published_at desc').limit(5)


    #@feed.order('updated_at desc').limit(5)
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
