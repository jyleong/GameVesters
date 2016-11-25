require 'test_helper'

class LeaderboardsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get leaderboards_controller_show_url
    assert_response :success
  end

end
