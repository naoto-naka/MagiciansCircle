require 'test_helper'

class EndUser::VideoRatingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get end_user_video_ratings_new_url
    assert_response :success
  end

  test "should get create" do
    get end_user_video_ratings_create_url
    assert_response :success
  end

  test "should get index" do
    get end_user_video_ratings_index_url
    assert_response :success
  end

  test "should get show" do
    get end_user_video_ratings_show_url
    assert_response :success
  end

  test "should get edit" do
    get end_user_video_ratings_edit_url
    assert_response :success
  end

  test "should get update" do
    get end_user_video_ratings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get end_user_video_ratings_destroy_url
    assert_response :success
  end

end
