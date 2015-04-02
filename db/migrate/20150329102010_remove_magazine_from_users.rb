class RemoveMagazineFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :magazine, :string
  end
end
