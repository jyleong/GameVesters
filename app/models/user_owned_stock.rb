class UserOwnedStock < ApplicationRecord
    validates(:user_id, presence: true)
	validates(:stock_id, presence: true)
    
	belongs_to :user
end
