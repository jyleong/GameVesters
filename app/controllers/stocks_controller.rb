class StocksController < ApplicationController
	def search
		if params[:stock]
		  @stock = Stock.find_by_symbol(params[:stock])
		  if @stock.nil?
		  	@stock = Stock.new_from_lookup(params[:stock])
		  end
			
		end

		if @stock
			puts "outputting stock"
			# render json: @stock
			puts @stock.name
		  # to see if functionality is working

			render partial: 'lookup', resource: @stock
		else
		  render status: :not_found, nothing: true
		end
	end

	def new
	    @stock = Stock.new
	end
	
	def index
	    @stocks = Stock.all
	end

	def show
		@stock = User.find(params[:id])
		
	end

	def search_page

	end


end
