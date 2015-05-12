class User < ActiveRecord::Base
	has_many :blog, dependent: :destroy
end
