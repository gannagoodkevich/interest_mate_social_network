require 'image_processing/mini_magick'

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :processing
  plugin :versions
  plugin :cached_attachment_data

  process(:store) do |io, _context|
    original = io.download
    pipeline = ImageProcessing::MiniMagick.source(original)

    size_small = pipeline.resize_to_limit!(300, 300)

    original.close!

    { original: io, small: size_small }
  end
end
