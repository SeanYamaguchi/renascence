class AddAwesomeNestedSetColumnsToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :lft, :integer
    add_column :communities, :rgt, :integer

    add_index :communities, :parent_id
    add_index :communities, :lft
    add_index :communities, :rgt
  
    add_column :communities, :depth, :integer
    add_column :communities, :children_count, :integer

    add_index :communities, :depth
  end
end
