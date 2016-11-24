require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get productos_index_url
    assert_response :success
  end

end
