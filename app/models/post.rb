class Post # < ActiveRecord::Base
	include Mongoid::Document
	field :title
	field :body
	# has_many :comments, dependent: :destroy
	# belongs_to :blog
	embeds_many :comments
	embedded_in :blog, :inverse_of => :posts
	validates :title, presence: true
	validates :body, presence: true
end
