class Slider < ActiveRecord::Base
	mount_uploader :slide, SlideUploader
	validates :slide, presence: true
end
