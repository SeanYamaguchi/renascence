class Posts::Document < ActiveRecord::Base
	mount_uploader :video, VideoUploader
	mount_uploader :picture, PictureUploader
	belongs_to :post
end
