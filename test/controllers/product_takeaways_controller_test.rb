require 'test_helper'

class ProductTakeawaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_takeaways_index_url
    assert_response :success
  end

end
