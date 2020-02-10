class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships

  has_one :address
  has_one :location
  has_many :posts
  has_many :comments
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_one :photo
end
