class StocksController < ApplicationController
	
	def search
		
		if params[:stock]
		  @stock = Stock.find_by_symbol(params[:stock])
		  @stock ||= Stock.new_from_lookup(params[:stock])
		  if @stock.nil?
		  	@stock = Stock.new_from_lookup(params[:stock])
		  end
		end
		# if @stock
		# 	# render json: @stock
		# 	render partial: 'lookup'
		# else
		# 	flash[:error] ="Stock not found"
		# 	render body: nil
		# end

		respond_to do |f|
			if @stock
				f.html {redirect_to 'my_portfolio'}
				f.json {render partial: 'lookup', locals: {stock: @stock}}
				f.js
			else
				flash[:error] = "Stock not found"
				f.json {render body: nil}
				f.js
			end
		end
	end

	def new
	    @stock = Stock.new
	end

	def index
	    @stocks = Stock.all

	    ## for each stock do find_by?
	    @stocks.each do |stock|
	    	stock = Stock.find_by_symbol(stock.symbol)
	    end
	    @stocks ## make sure we return it

	end

	def show
		@stock = Stock.find(params[:id])	

	end

end
