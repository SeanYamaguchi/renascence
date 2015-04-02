require 'test_helper'

class Posts::PicturesControllerTest < ActionController::TestCase
  setup do
    @posts_picture = posts_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create posts_picture" do
    assert_difference('Posts::Picture.count') do
      post :create, posts_picture: { picture: @posts_picture.picture }
    end

    assert_redirected_to posts_picture_path(assigns(:posts_picture))
  end

  test "should show posts_picture" do
    get :show, id: @posts_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @posts_picture
    assert_response :success
  end

  test "should update posts_picture" do
    patch :update, id: @posts_picture, posts_picture: { picture: @posts_picture.picture }
    assert_redirected_to posts_picture_path(assigns(:posts_picture))
  end

  test "should destroy posts_picture" do
    assert_difference('Posts::Picture.count', -1) do
      delete :destroy, id: @posts_picture
    end

    assert_redirected_to posts_pictures_path
  end
end
