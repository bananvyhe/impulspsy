class Slider < ActiveRecord::Base
	mount_uploader :slide, SlideUploader
end
