class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.text :text
      t.string :video
      t.string :picture
      t.integer :post_id

      t.timestamps
    end
  end
end
