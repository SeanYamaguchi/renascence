class Post < ActiveRecord::Base
	validates :subject, :presence => true
	mount_uploader :picture, PictureUploader
	mount_uploader :video, VideoUploader
	has_many :documents
	acts_as_taggable
	acts_as_taggable_on :genres_list

end
