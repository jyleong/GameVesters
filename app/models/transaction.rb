class Transaction < ApplicationRecord
	validates :quantity, :presence => true
	belongs_to :user
	# belongs_to :stock

	
	def hasEnoughMoney?(stock, quantity)
		return current_user.currency > (stock.current_price * quantity)
	end


end
