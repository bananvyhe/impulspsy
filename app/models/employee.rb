class Employee < ActiveRecord::Base
	validates :name, presence: true
	validates :spec, presence:true
	validates :education, presence:true
	validates :addeducation, presence:true
	validates :programms, presence:true
	validates :avatar, presence: true

	mount_uploader :avatar, AvatarUploader
end
