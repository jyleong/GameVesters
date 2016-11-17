class StaticPagesController < ApplicationController
  def home
  	# if logged_in?
  	#  	@micropost  = current_user.microposts.build
   #   	@feed_items = current_user.feed.paginate(page: params[:page], per_page: 15)
  	# end
    @stocks = StockQuote::Stock.quote(["optt", "dcix", "esea", "ship","drys"])

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
