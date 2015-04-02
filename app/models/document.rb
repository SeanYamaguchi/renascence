class Document < ActiveRecord::Base
	belongs_to :post
	mount_uploader :picture, PictureUploader
	mount_uploader :video, VideoUploader
end
