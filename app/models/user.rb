class User < ApplicationRecord
  has_one :address
  has_many :posts
  has_many :user_interests
  has_many :interests, through: :user_interests
end
