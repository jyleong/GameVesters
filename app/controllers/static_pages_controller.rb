class StaticPagesController < ApplicationController
  def home

    @stocks = StockQuote::Stock.quote(["optt", "dcix", "esea", "ship","drys"])
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
