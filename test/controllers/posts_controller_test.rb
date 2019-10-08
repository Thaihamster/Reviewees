require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index2" do
    get posts_index2_url
    assert_response :success
  end

end
