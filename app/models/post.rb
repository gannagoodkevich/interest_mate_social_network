class Post < ApplicationRecord
  paginates_per 5

  has_many :post_tags
  has_many :tags, through: :post_tags, validate: true
  has_many :comments, as: :commentable
  has_many :post_categories
  has_many :categories, through: :post_categories
  belongs_to :user, optional: true
  has_many :liked_posts_users
  has_many :liked_users, through: :liked_posts_users, source: :user

  enum status: { visible: 0, unvisible: 1 }

  validates :title, presence: true
  validates :content, presence: true
  validates_associated :tags
end
