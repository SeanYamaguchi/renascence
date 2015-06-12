class AddDetailsToCommunities < ActiveRecord::Migration
  def change
  	add_index :communities, :name, unique: true
  	change_column_null :communities, :name, false
  	change_column_null :communities, :email, false
  	change_column_null :communities, :purpose, false
  	change_column_null :communities, :activity, false
  	change_column_null :communities, :end_date, false
  	change_column_null :communities, :leader, false
  	change_column_default :communities, :logo, "app/assets/images/no-logo.png"
  end
end
