require 'test_helper'

class SeeCurriculumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get see_curriculums_index_url
    assert_response :success
  end

end
