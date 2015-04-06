class Users::UserProfiles::AvatarsController < ApplicationController
  before_action :set_users_user_profiles_avatar, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @users_user_profiles_avatars = Users::UserProfiles::Avatar.all
    respond_with(@users_user_profiles_avatars)
  end

  def show
    respond_with(@users_user_profiles_avatar)
  end

  def new
    @users_user_profiles_avatar = Users::UserProfiles::Avatar.new
    respond_with(@users_user_profiles_avatar)
  end

  def edit
  end

  def create
    @users_user_profiles_avatar = Users::UserProfiles::Avatar.new(users_user_profiles_avatar_params)
    @users_user_profiles_avatar.save
    respond_with(@users_user_profiles_avatar)
  end

  def update
    @users_user_profiles_avatar.update(avatar_params)
    respond_with(@users_user_profiles_avatar)
  end

  def destroy
    @users_user_profiles_avatar.destroy
    respond_with(@users_user_profiles_avatar)
  end

  private
    def set_users_user_profiles_avatar
      @users_user_profiles_avatar = Users::UserProfiles::Avatar.find(params[:id])
    end

    def users_user_profiles_avatar_params
      params.require(:users_user_profiles_avatar).permit(:avatar, :remove_avatar, :avatar_cache, :user_id)
    end
end
