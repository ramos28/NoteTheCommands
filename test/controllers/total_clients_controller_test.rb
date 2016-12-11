require 'test_helper'

class TotalClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get total_clients_index_url
    assert_response :success
  end

end
