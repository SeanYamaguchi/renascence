class CreateUsersUserProfilesAvatars < ActiveRecord::Migration
  def change
    create_table :users_user_profiles_avatars do |t|
      t.string :avatar
      t.boolean :remove_avatar
      t.string :avatar_cache
      t.integer :user_id

      t.timestamps
    end
  end

  def change
    create_table :avatars do |t|
      t.string :avatar
      t.boolean :remove_avatar
      t.string :avatar_cache
      t.integer :user_id

      t.timestamps
    end
  end
end
