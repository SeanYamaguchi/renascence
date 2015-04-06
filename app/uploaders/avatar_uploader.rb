# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
     "no-avatar.png"
  end

  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ['avatar']

  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumbnail do
    process :resize_to_fit => [50, 50]
  end

  def public_id
    return model.id
  end

end
