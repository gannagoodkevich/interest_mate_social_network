class Tag < ApplicationRecord
  searchkick word_start: [:name]

  has_many :post_tags
  has_many :posts, through: :post_tags
end
