require 'test_helper'

class StudentControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get student_home_url
    assert_response :success
  end

  test "should get show" do
    get student_show_url
    assert_response :success
  end

  test "should get search" do
    get student_search_url
    assert_response :success
  end

end
