require 'test_helper'

class CuestionarioControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cuestionario_new_url
    assert_response :success
  end

  test "should get create" do
    get cuestionario_create_url
    assert_response :success
  end

  test "should get update" do
    get cuestionario_update_url
    assert_response :success
  end

  test "should get edit" do
    get cuestionario_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get cuestionario_destroy_url
    assert_response :success
  end

  test "should get index" do
    get cuestionario_index_url
    assert_response :success
  end

  test "should get show" do
    get cuestionario_show_url
    assert_response :success
  end

end
