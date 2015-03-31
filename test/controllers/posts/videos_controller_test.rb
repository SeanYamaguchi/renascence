require 'test_helper'

class Posts::VideosControllerTest < ActionController::TestCase
  setup do
    @posts_video = posts_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create posts_video" do
    assert_difference('Posts::Video.count') do
      post :create, posts_video: { video: @posts_video.video }
    end

    assert_redirected_to posts_video_path(assigns(:posts_video))
  end

  test "should show posts_video" do
    get :show, id: @posts_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @posts_video
    assert_response :success
  end

  test "should update posts_video" do
    patch :update, id: @posts_video, posts_video: { video: @posts_video.video }
    assert_redirected_to posts_video_path(assigns(:posts_video))
  end

  test "should destroy posts_video" do
    assert_difference('Posts::Video.count', -1) do
      delete :destroy, id: @posts_video
    end

    assert_redirected_to posts_videos_path
  end
end
