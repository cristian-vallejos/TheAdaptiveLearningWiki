require 'test_helper'

class ExpertControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get expert_home_url
    assert_response :success
  end

  test "should get new" do
    get expert_new_url
    assert_response :success
  end

  test "should get create" do
    get expert_create_url
    assert_response :success
  end

  test "should get edit" do
    get expert_edit_url
    assert_response :success
  end

  test "should get update" do
    get expert_update_url
    assert_response :success
  end

  test "should get show" do
    get expert_show_url
    assert_response :success
  end

end
