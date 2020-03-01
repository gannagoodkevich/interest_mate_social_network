require "shrine"
require "shrine/storage/s3"

s3_options = { bucket: ENV['S3_BUCKET_NAME'],
region: "N/A",
access_key_id: ENV["AWS_ACCESS_KEY_ID=AKIAINWT4PLSDPX6YD3Q"],
secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"] }

Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(**s3_options),
}

Shrine.plugin :activerecord           # load Active Record integration
Shrine.plugin :cached_attachment_data # for retaining cached file on form redisplays
Shrine.plugin :restore_cached_data    # refresh metadata for cached files