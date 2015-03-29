class RemoveMailMagazineFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :magazine, :boolean
  end
end
