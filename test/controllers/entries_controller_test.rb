require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get entries_show_url
    assert_response :success
  end

  test "should get create" do
    get entries_create_url
    assert_response :success
  end

  test "should get index" do
    get entries_index_url
    assert_response :success
  end

  test "should get destroy" do
    get entries_destroy_url
    assert_response :success
  end

end
