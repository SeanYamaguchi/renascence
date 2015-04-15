class Document < ActiveRecord::Base
	belongs_to :post
	belongs_to :blog
	mount_uploader :picture, PictureUploader
	mount_uploader :video, VideoUploader
end
