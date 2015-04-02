class CreateAdminUsersMailmagazines < ActiveRecord::Migration
  def change
    create_table :admin_users_mailmagazines do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
