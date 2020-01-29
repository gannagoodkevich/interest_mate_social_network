require "image_processing/mini_magick"

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :processing
  plugin :versions, names: [:original, :thumb]

  def process(io, context)
    case context[:phase]
    when :store
      thumb = resize_to_limit!(io.download, 300, 300)
      { original: io, thumb: thumb }
    end
  end
end