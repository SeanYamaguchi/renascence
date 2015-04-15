class AddEverythingToBlogs < ActiveRecord::Migration
  def change
  	add_column :blogs, :video, :string
  	add_column :blogs, :picture, :string
  end
end
