VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


class User < ApplicationRecord
	before_save :defaults
	before_save {self.email = email.downcase}
	validates(:name, presence: true, length: {maximum: 30})
	validates(:email, presence: true, length: {maximum: 40},
		format: {with: VALID_EMAIL_REGEX}, uniqueness: 
		{case_sensitive: false})
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	private

		def defaults
			self.admin = false
			self.currency = 0
		end
end
