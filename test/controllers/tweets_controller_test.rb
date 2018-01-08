require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tweets_url
    assert_response :success
  end
end
