require 'test_helper'

class MenuCommandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get menu_commands_index_url
    assert_response :success
  end

end
