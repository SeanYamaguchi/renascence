class Community < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
  has_closure_tree
  has_and_belongs_to_many :users
end
