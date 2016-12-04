class StocksController < ApplicationController
  before_action :getStock, only: :search
  # before_action :logged_in_user ,only: [:index]

  def search
    ## this method user getStock function
    respond_to do |f|
      if @stock
        chart_url_query = build_url_params
        chart_url_base = "http://chart.finance.yahoo.com"
        @chart_url = "#{chart_url_base}/#{chart_url_query}"

        # f.html {redirect_to my_portfolio_path}
        # f.json {render partial: 'lookup', locals: {stock: @stock}}
        # redirect_to my_portfolio_path
        f.js
      else
        # flash[:error] = "Stock not found"
        # f.json {render body: nil}
        f.js
      end
    end
  end

    def index
        @stocks = Stock.all

        ## for each stock do find_by?
        @stocks.each do |stock|
            if (stock.compareTime())
              stock = Stock.find_by_symbol(stock.symbol)

            end
        end
        @stocks ## make sure we return it
    end

  def show
    @stock = Stock.where(id: params[:id]).select(:id,:symbol,
        :name, :current_price,
        :amount_change, :percent_change,
        :year_high,
        :year_low, :description).take
    
    chart_url_query = build_url_params
    chart_url_base = "http://chart.finance.yahoo.com"
    @chart_url = "#{chart_url_base}/#{chart_url_query}"
  end


  def new
    @stock = Stock.new
  end

  private
    def build_url_params
      symbol = @stock.symbol
      url_query = "z?s=#{symbol}&t=6m&q=l&l=on&z=s&p=m50,m356"
    end

    def getStock
      if params[:stock]
        @stock = Stock.find_by_symbol(params[:stock])
        @stock ||= Stock.new_from_lookup(params[:stock])
      end
    end

end
