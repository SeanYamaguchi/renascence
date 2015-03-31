class AddVideoPictureToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :video_id, :integer
    add_column :posts, :picture_id, :integer
  end
end
