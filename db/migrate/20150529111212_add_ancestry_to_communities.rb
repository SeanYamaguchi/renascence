class AddAncestryToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :ascestry, :string
  end

  def down
  	remove_column :communities, :ancestry, :string
  end
end
