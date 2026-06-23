require "test_helper"

class UserAwardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_award = user_awards(:one)
  end

  test "should get index" do
    get user_awards_url
    assert_response :success
  end

  test "should get new" do
    get new_user_award_url
    assert_response :success
  end

  test "should create user_award" do
    assert_difference("UserAward.count") do
      post user_awards_url, params: { user_award: { award_id: @user_award.award_id, user_id: @user_award.user_id } }
    end

    assert_redirected_to user_award_url(UserAward.last)
  end

  test "should show user_award" do
    get user_award_url(@user_award)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_award_url(@user_award)
    assert_response :success
  end

  test "should update user_award" do
    patch user_award_url(@user_award), params: { user_award: { award_id: @user_award.award_id, user_id: @user_award.user_id } }
    assert_redirected_to user_award_url(@user_award)
  end

  test "should destroy user_award" do
    assert_difference("UserAward.count", -1) do
      delete user_award_url(@user_award)
    end

    assert_redirected_to user_awards_url
  end
end
