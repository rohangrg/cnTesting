require 'test_helper'

class AvieControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get avie_index_url
    assert_response :success
  end

end
