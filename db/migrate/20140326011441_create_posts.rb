class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.date :date
      t.string :subject
      t.text :body
      t.string :picture
      t.timestamps
      t.string :video
    end
  end
end
