class Comment < ApplicationRecord
  has_one :post
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :user, polymorphic: true, optional: true
end
