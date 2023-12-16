require "test_helper"

class DashboardItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_items_index_url
    assert_response :success
  end

  test "should get show" do
    get dashboard_items_show_url
    assert_response :success
  end

  test "should get new" do
    get dashboard_items_new_url
    assert_response :success
  end

  test "should get create" do
    get dashboard_items_create_url
    assert_response :success
  end

  test "should get edit" do
    get dashboard_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get dashboard_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dashboard_items_destroy_url
    assert_response :success
  end
end
