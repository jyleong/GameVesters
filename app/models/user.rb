VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


class User < ApplicationRecord
	attr_accessor :remember_token
	before_save :defaults
	before_save {self.email = email.downcase}
	validates(:name, presence: true, length: {maximum: 30})
	validates(:email, presence: true, length: {maximum: 40},
		format: {with: VALID_EMAIL_REGEX}, uniqueness: 
		{case_sensitive: false})
	has_secure_password
	validates :password, presence: true, length: { minimum: 8 }


	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
	end

	#random token used for session
	def User.new_token
		SecureRandom.urlsafe_base64
	end
	#remember in db for user persisent session
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end
	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	#under users table forget
	def forget
		update_attribute(:remember_digest, nil)
	end
	private

		def defaults
			self.admin = false unless self.admin
			self.currency = 0
		end
end
