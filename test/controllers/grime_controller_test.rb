require 'test_helper'

class GrimeControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get grime_create_url
    assert_response :success
  end

  test "should get index" do
    get grime_index_url
    assert_response :success
  end

  test "should get new" do
    get grime_new_url
    assert_response :success
  end

  test "should get destroy" do
    get grime_destroy_url
    assert_response :success
  end

  test "should get show" do
    get grime_show_url
    assert_response :success
  end

end
