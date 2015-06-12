class AddAncestryToCommunities < ActiveRecord::Migration
  def change
  	add_column :communities, :ancestry, :string
  	add_column :communities, :parent_id, :integer
  end
end
