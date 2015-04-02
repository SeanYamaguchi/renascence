require 'test_helper'

class AdminUsers::MailmagazinesControllerTest < ActionController::TestCase
  setup do
    @admin_users_mailmagazine = admin_users_mailmagazines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_users_mailmagazines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_users_mailmagazine" do
    assert_difference('AdminUsers::Mailmagazine.count') do
      post :create, admin_users_mailmagazine: { body: @admin_users_mailmagazine.body, title: @admin_users_mailmagazine.title }
    end

    assert_redirected_to admin_users_mailmagazine_path(assigns(:admin_users_mailmagazine))
  end

  test "should show admin_users_mailmagazine" do
    get :show, id: @admin_users_mailmagazine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_users_mailmagazine
    assert_response :success
  end

  test "should update admin_users_mailmagazine" do
    patch :update, id: @admin_users_mailmagazine, admin_users_mailmagazine: { body: @admin_users_mailmagazine.body, title: @admin_users_mailmagazine.title }
    assert_redirected_to admin_users_mailmagazine_path(assigns(:admin_users_mailmagazine))
  end

  test "should destroy admin_users_mailmagazine" do
    assert_difference('AdminUsers::Mailmagazine.count', -1) do
      delete :destroy, id: @admin_users_mailmagazine
    end

    assert_redirected_to admin_users_mailmagazines_path
  end
end
