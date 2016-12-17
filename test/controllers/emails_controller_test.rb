require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get emails_index_url
    assert_response :success
  end

  test "should get new" do
    get emails_new_url
    assert_response :success
  end

  test "should get edit" do
    get emails_edit_url
    assert_response :success
  end

  test "should get show" do
    get emails_show_url
    assert_response :success
  end

  test "should get _form" do
    get emails__form_url
    assert_response :success
  end

end
