class Comment # < ActiveRecord::Base
  include Mongoid::Document
  field :commenter
  field :body
  # belongs_to :post
  embedded_in :post, :inverse_of => :comments
end
