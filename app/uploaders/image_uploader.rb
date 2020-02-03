require 'image_processing/mini_magick'

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :processing
  plugin :versions
  plugin :cached_attachment_data

  process(:store) do |io, _context|
    original = io.download
    pipeline = ImageProcessing::MiniMagick.source(original)

    small_size = pipeline.resize_to_limit!(300, 300)

    original.close!

    { original: io, small: small_size }
  end
end
