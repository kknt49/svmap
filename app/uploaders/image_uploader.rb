class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :fog 
   storage :file     
  
  #if Rails.env == 'production'
  #  storage :fog  
  #else   
  #  storage :file  
  #end
  
  process :resize_to_limit => [800, 800] 
  
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end



# 写真からGPS情報を取得
  
  require 'exifr/jpeg'
  
  process :get_gps
  
  def get_gps
    @location = Location.new

    if gps = EXIFR::JPEG::new(self.file.file).gps
      @location.latitude = EXIFR::JPEG::new(self.file.file).gps.latitude
      @location.longitude = EXIFR::JPEG::new(self.file.file).gps.longitude
    else
      @location.latitude = 200
      @location.longitude = 0
    end
    
    @location.save
    #binding.pry
  end 



# アップロードした写真が回転してしまう問題に対応

  process :fix_rotate

  def fix_rotate
    manipulate! do |img|
      img = img.auto_orient
      img = yield(img) if block_given?
      img
    end
  end
  
end
