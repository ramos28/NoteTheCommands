require 'test_helper'

class TakeawaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get takeaways_index_url
    assert_response :success
  end

end
