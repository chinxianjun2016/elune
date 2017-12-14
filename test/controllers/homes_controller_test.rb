require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get dashborad" do
    get homes_dashborad_url
    assert_response :success
  end

end
