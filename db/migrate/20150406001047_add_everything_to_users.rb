class AddEverythingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :remove_avatar, :boolean
    add_column :users, :avatae_cache, :string
  end
end
