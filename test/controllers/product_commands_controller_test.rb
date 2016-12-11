require 'test_helper'

class ProductCommandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_commands_index_url
    assert_response :success
  end

end
