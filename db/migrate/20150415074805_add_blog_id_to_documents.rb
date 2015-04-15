class AddBlogIdToDocuments < ActiveRecord::Migration
  def change
  	add_column :documents, :blog_id, :string
  end
end
