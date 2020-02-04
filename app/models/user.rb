class User < ApplicationRecord
  has_one :address
  has_many :posts
  has_many :comments, as: :commentable
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_one :photo
end
