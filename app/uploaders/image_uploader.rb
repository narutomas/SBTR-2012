# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  include CarrierWave::MiniMagick

  if Rails.env.test?
    storage :file
  else
    storage :fog
  end

  process :resize_to_fit => [nil, 506]

  version :thumb do
    process :resize_to_fit => [nil, 230]
  end

  def store_dir
    "#{model.class.to_s.underscore}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "image.jpg" if original_filename
  end
end
