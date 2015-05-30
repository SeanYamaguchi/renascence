class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.string :logo
      t.string :email
      t.text :purpose
      t.text :activity
      t.boolean :locked
      t.date :end_date
      t.string :leader

      t.timestamps
    end
  end
end
