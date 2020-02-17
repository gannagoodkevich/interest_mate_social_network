require 'elasticsearch/model'

class Tag < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: 'true' do
      indexes :name, type: 'string', analyzer: :english
    end
  end

  has_many :post_tags
  has_many :posts, through: :post_tags
end
