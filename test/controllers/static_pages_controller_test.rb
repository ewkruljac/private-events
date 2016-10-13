require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

#----------

  test "root should be home" do
    get root_url
    assert_response :success
  end
end
