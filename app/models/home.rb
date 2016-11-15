class Home < ActiveRecord::Base
	mount_uploader :slide, SlideUploader
end
