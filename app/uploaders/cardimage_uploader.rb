class CardimageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  process resize_to_fit: [360, 360]

  # Override the directory where uploaded files will be stored.
  def store_dir
    "flashcard777/flashcard777/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small do
    process resize_to_fill: [50, 50]
  end

end
