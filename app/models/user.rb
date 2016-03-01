class User < ActiveRecord::Base
  has_one :profile
  has_many :posts
  has_many :comments
end
