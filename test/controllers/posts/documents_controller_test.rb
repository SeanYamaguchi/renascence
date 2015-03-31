require 'test_helper'

class Posts::DocumentsControllerTest < ActionController::TestCase
  setup do
    @posts_document = posts_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create posts_document" do
    assert_difference('Posts::Document.count') do
      post :create, posts_document: { text: @posts_document.text }
    end

    assert_redirected_to posts_document_path(assigns(:posts_document))
  end

  test "should show posts_document" do
    get :show, id: @posts_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @posts_document
    assert_response :success
  end

  test "should update posts_document" do
    patch :update, id: @posts_document, posts_document: { text: @posts_document.text }
    assert_redirected_to posts_document_path(assigns(:posts_document))
  end

  test "should destroy posts_document" do
    assert_difference('Posts::Document.count', -1) do
      delete :destroy, id: @posts_document
    end

    assert_redirected_to posts_documents_path
  end
end
