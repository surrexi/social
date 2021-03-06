# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  storage :file

  def default_url
    "default.png"
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
