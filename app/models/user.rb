class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  paginates_per 6

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  enum rights: { admin: 0, regular_user: 1 }

  has_many :friendship_requests_as_requestor, foreign_key: 'receiver_id', class_name: 'FriendshipRequest', dependent: :destroy
  has_many :requestors, through: :friendship_requests_as_requestor
  has_many :friendship_requests_as_receiver, foreign_key: 'requestor_id', class_name: 'FriendshipRequest', dependent: :destroy
  has_many :receivers, through: :friendship_requests_as_receiver

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_one :address
  has_one :location
  has_many :posts, dependent: :destroy
  has_many :liked_posts_users
  has_many :liked_posts, through: :liked_posts_users, source: :post, foreign_key: 'liked_user_id'
  has_many :comments, dependent: :destroy
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_one :photo

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def apply_omniauth(auth)
    update_attributes(
      provider: auth.provider,
      uid: auth.uid
    )
  end

  def all_friends
    friends + inverse_friends
  end
end
