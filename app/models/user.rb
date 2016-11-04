VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


class User < ApplicationRecord

	validates(:name, presence: true, length: {maximum: 30})
	validates(:email, presence: true, length: {maximum: 40},
		format: {with: VALID_EMAIL_REGEX}, uniqueness: 
		{case_sensitive: false})
end