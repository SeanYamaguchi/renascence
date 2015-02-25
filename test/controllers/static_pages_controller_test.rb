require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get company" do
    get :company
    assert_response :success
  end

  test "should get organization" do
    get :organization
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
