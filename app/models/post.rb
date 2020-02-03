class Post < ApplicationRecord
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  belongs_to :user
end
