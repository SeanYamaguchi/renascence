class AddEveryColumnsToBlogs < ActiveRecord::Migration
  def change
  	add_column :blogs, :body, :text
  	add_column :blogs, :subject, :string
  	add_column :blogs, :date, :date
  end
end