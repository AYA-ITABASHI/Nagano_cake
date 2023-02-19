require "test_helper"

class Public::AdressControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_adress_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_adress_edit_url
    assert_response :success
  end

  test "should get create" do
    get public_adress_create_url
    assert_response :success
  end

  test "should get update" do
    get public_adress_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_adress_destroy_url
    assert_response :success
  end
end
