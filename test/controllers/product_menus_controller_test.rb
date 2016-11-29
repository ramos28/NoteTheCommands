require 'test_helper'

class ProductMenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_menus_index_url
    assert_response :success
  end

end
