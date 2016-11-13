class Stock < ApplicationRecord

	has_many :user_stocks
	has_many :users, through: :user_stocks
	# validates :symbol, :presence => true, :uniqueness => true

	def self.find_by_symbol(ticker_symbol)
		
		retrievedStock = where(symbol: ticker_symbol.upcase).first
		return retrievedStock
	end

	def self.new_from_lookup(ticker_symbol)
		looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
		return nil unless looked_up_stock.name
		@new_stock = Stock.create(symbol: looked_up_stock.symbol, name: looked_up_stock.name)
		##debugger
		
		@new_stock.current_price = @new_stock.price ##
		@new_stock.save
		@new_stock
	end

	def price
		closing_price = StockQuote::Stock.quote(symbol)

		return "#{closing_price.previous_close} (Closing)" if closing_price.previous_close ## basicalyl if not nill

		opening_price = StockQuote::Stock.quote(symbol)
		return "#{opening_price.open} (Opening)" if opening_price.open
	'Unavailable'
	end
end
