require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get story" do
    get :story
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

  test "should get media" do
    get :media
    assert_response :success
  end

  test "should get discovery" do
    get :discovery
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
