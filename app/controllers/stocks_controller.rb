class StocksController < ApplicationController
	def search
		if params[:stock]
		  @stock = Stock.find_by_symbol(params[:stock])
		  @stock ||= Stock.new_from_lookup(params[:stock])
			@stock.save
		end

		if @stock
			
		# render json: @stock
		  # to see if functionality is working

		  render partial: 'lookup'
		else
		  render status: :not_found, nothing: true
		end
	end
end
