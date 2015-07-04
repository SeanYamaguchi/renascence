class AddSomethingToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :tag, :integer
    add_column :communities, :parent_id, :integer
  end
end
