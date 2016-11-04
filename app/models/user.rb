VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


class User < ApplicationRecord
	has_many :active_relationships,  class_name:  "Relationship",
	                               foreign_key: "follower_id",
	                               dependent:   :destroy
	has_many :passive_relationships, class_name:  "Relationship",
	                               foreign_key: "followed_id",
	                               dependent:   :destroy
	has_many :following, through: :active_relationships,  source: :followed
	has_many :followers, through: :passive_relationships, source: :follower
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

	# Follows a user.
	def follow(other_user)
		active_relationships.create(followed_id: other_user.id)
	end

	# Unfollows a user.
	def unfollow(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	end

	# Returns true if the current user is following the other user.
	def following?(other_user)
		following.include?(other_user)
	end
	
	private

		def defaults
			self.admin = false unless self.admin
			self.currency = 0
		end
end
