class User < ActiveRecord::Base
	has_many :blogs, dependent: :destroy
	validates :username, presence: true
	validates :password, presence: true, length: { minimum: 8 }
end
