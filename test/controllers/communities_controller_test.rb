require 'test_helper'

class CommunitiesControllerTest < ActionController::TestCase
  setup do
    @community = communities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:communities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create community" do
    assert_difference('Community.count') do
      post :create, community: { activity: @community.activity, email: @community.email, end_date: @community.end_date, leader: @community.leader, locked: @community.locked, logo: @community.logo, name: @community.name, purpose: @community.purpose }
    end

    assert_redirected_to community_path(assigns(:community))
  end

  test "should show community" do
    get :show, id: @community
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @community
    assert_response :success
  end

  test "should update community" do
    patch :update, id: @community, community: { activity: @community.activity, email: @community.email, end_date: @community.end_date, leader: @community.leader, locked: @community.locked, logo: @community.logo, name: @community.name, purpose: @community.purpose }
    assert_redirected_to community_path(assigns(:community))
  end

  test "should destroy community" do
    assert_difference('Community.count', -1) do
      delete :destroy, id: @community
    end

    assert_redirected_to communities_path
  end
end
