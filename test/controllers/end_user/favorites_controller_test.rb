require 'test_helper'

class EndUser::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get end_user_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get end_user_favorites_destroy_url
    assert_response :success
  end

end
