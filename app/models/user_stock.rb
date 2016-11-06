class UserStock < ApplicationRecord
	belongs_to :User
	belongs_to :stock
end
