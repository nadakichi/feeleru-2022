require 'test_helper'

class FeeleruControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feeleru_index_url
    assert_response :success
  end

end
