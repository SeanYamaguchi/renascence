class Users::UsersController < ActionController::Base
  def index
    @users = User.all
  end
end