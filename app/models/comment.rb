# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true, optional: true
  has_many :comments, as: :commentable
  belongs_to :user

  validates :content, presence: true
end
