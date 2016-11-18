class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  #process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :big do
    process :resize_to_fit => [nil, 600]
    
  end

  version :medium do
    #process :resize_to_fit => [250, 380]
    process :resize_to_fit => [nil, 280]
    process crop: '260x280+0+0'
    #process resize_and_crop: 250
  end

  version :thumb do
   # 
   process :make_thumb
  end

  # merge "mask 'n' paint" images with a gray image,
  # to create a "lighting mask"

  def crop(geometry)
    manipulate! do |img|      
      img.crop(geometry)
      img
    end    
  end

  def resize_and_crop(size)  
    manipulate! do |image|                 
      if image[:width] < image[:height]
        remove = ((image[:height] - image[:width])/2).round 
        image.shave("0x#{remove}") 
      elsif image[:width] > image[:height] 
        remove = ((image[:width] - image[:height])/2).round
        image.shave("#{remove}x0")
      end
      image.resize("#{size}x#{size}")
      image
    end
  end

  def make_thumb
     
    resize_to_fit(80,80)
     
    manipulate! do |image|
      image.combine_options do |c|
      c.mattecolor '#555555'  
      c.frame  '1x1' 
       
    end
    image   
  end
end


  

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
