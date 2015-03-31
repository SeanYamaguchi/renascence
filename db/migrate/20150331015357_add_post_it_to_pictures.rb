class AddPostItToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :post_id, :integer
  end
end
