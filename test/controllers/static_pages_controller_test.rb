require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
   get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | 履修計画"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | 履修計画"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | 履修計画"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | 履修計画"
  end
end