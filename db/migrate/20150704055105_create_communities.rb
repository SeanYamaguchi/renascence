class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.string :email
      t.text :summary
      t.text :purpose
      t.integer :user_id

      t.timestamps
    end
  end
end
