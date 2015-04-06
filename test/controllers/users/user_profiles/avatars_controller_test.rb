require 'test_helper'

class Users::UserProfiles::AvatarsControllerTest < ActionController::TestCase
  setup do
    @users_user_profiles_avatar = users_user_profiles_avatars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_user_profiles_avatars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_user_profiles_avatar" do
    assert_difference('Users::UserProfiles::Avatar.count') do
      post :create, users_user_profiles_avatar: { avatar: @users_user_profiles_avatar.avatar, avatar_cache: @users_user_profiles_avatar.avatar_cache, remove_avatar: @users_user_profiles_avatar.remove_avatar, user_id: @users_user_profiles_avatar.user_id }
    end

    assert_redirected_to users_user_profiles_avatar_path(assigns(:users_user_profiles_avatar))
  end

  test "should show users_user_profiles_avatar" do
    get :show, id: @users_user_profiles_avatar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_user_profiles_avatar
    assert_response :success
  end

  test "should update users_user_profiles_avatar" do
    patch :update, id: @users_user_profiles_avatar, users_user_profiles_avatar: { avatar: @users_user_profiles_avatar.avatar, avatar_cache: @users_user_profiles_avatar.avatar_cache, remove_avatar: @users_user_profiles_avatar.remove_avatar, user_id: @users_user_profiles_avatar.user_id }
    assert_redirected_to users_user_profiles_avatar_path(assigns(:users_user_profiles_avatar))
  end

  test "should destroy users_user_profiles_avatar" do
    assert_difference('Users::UserProfiles::Avatar.count', -1) do
      delete :destroy, id: @users_user_profiles_avatar
    end

    assert_redirected_to users_user_profiles_avatars_path
  end
end
