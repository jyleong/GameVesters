class Stock < ApplicationRecord

	has_many :user_stocks
	has_many :users, through: :user_stocks

	def self.find_by_symbol(ticker_symbol)
		where(symbol: ticker_symbol).first
	end

	def self.new_from_lookup(ticker_symbol)
		looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
		return nil unless looked_up_stock.name
		puts looked_up_stock.name
		puts looked_up_stock.response_code
		puts looked_up_stock.ask
		puts looked_up_stock.previous_close
		@new_stock = new(symbol: looked_up_stock.symbol, name: looked_up_stock.name)
		begin
			@new_stock.current_price = @new_stock.price ##
			raise 'error occured'
		rescue
			puts "rescue done"
		end
		@new_stock
	end

	def price
		closing_price = StockQuote::Stock.quote(:symbol).ask

		puts "trying this execution"
		return "#{closing_price} (Closing)" if closing_price ## basicalyl if not nill

		opening_price = StockQuote::Stock.quote(:symbol).open
		return "#{opening_price} (Opening)" if opening_price
	'Unavailable'
	end
end
