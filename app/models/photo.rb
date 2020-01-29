class Photo < ApplicationRecord
  include ImageUploader::Attachment(:image)

  #validates_presence_of :image
end
