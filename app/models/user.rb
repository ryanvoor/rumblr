class User # < ActiveRecord::Base
	include Mongoid::Document
	field :username
	field :password
	field :color
	has_many :blogs, dependent: :destroy
	# embeds_many :blogs
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true, length: { minimum: 8 }
end
