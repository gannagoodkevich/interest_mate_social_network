class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendship_requests_as_requestor, foreign_key: 'receiver_id', class_name: 'FriendshipRequest'
  has_many :requestors, through: :friendship_requests_as_requestor
  has_many :friendship_requests_as_receiver, foreign_key: 'requestor_id', class_name: 'FriendshipRequest'
  has_many :receivers, through: :friendship_requests_as_receiver

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
