class Post < ActiveRecord::Base
	validates :subject, :presence => true
	mount_uploader :picture, PictureUploader
	mount_uploader :video, VideoUploader
end
