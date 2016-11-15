class Stock < ApplicationRecord

	has_many :user_stocks
	has_many :transcations
	has_many :users, through: :user_stocks
	# validates :symbol, :presence => true, :uniqueness => true

	def self.find_by_symbol(ticker_symbol)
		
		retrievedStock = where(symbol: ticker_symbol.upcase).first

		## logic to always query?
		looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
		retrievedStock.update(current_price: looked_up_stock.ask, amount_change: looked_up_stock.change)
		retrievedStock.save
		return retrievedStock
	end

	def self.new_from_lookup(ticker_symbol)
		looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
		return nil unless looked_up_stock.name
		@new_stock = Stock.create(symbol: looked_up_stock.symbol, name: looked_up_stock.name)
		##debugger
		
		@new_stock.current_price = @new_stock.price ##
		@new_stock.year_high = looked_up_stock.year_high
		@new_stock.year_low = looked_up_stock.year_low
		@new_stock.amount_change = looked_up_stock.change
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
	def compareTime()
      currentTime = DateTime.now

      return ((currentTime.to_i - updated_at.to_i)/3600 > 0)
    end
end
