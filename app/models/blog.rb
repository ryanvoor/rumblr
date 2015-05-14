class Blog # < ActiveRecord::Base
  include Mongoid::Document
  field :title
  # has_many :posts, dependent: :destroy
  belongs_to :user
  embeds_many :posts
  # embedded_in :user, :inverse_of => :blogs
  validates :title, presence: true
end
