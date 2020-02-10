class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_one :address
  has_one :location
  has_many :posts
  has_many :comments
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_one :photo
end
