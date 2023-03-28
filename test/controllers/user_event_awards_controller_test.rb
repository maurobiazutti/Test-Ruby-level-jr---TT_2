require "test_helper"

class UserEventAwardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_event_award = user_event_awards(:one)
  end

  test "should get index" do
    get user_event_awards_url
    assert_response :success
  end

  test "should get new" do
    get new_user_event_award_url
    assert_response :success
  end

  test "should create user_event_award" do
    assert_difference("UserEventAward.count") do
      post user_event_awards_url, params: { user_event_award: { award_id: @user_event_award.award_id, description: @user_event_award.description, event_id: @user_event_award.event_id, user_id: @user_event_award.user_id } }
    end

    assert_redirected_to user_event_award_url(UserEventAward.last)
  end

  test "should show user_event_award" do
    get user_event_award_url(@user_event_award)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_event_award_url(@user_event_award)
    assert_response :success
  end

  test "should update user_event_award" do
    patch user_event_award_url(@user_event_award), params: { user_event_award: { award_id: @user_event_award.award_id, description: @user_event_award.description, event_id: @user_event_award.event_id, user_id: @user_event_award.user_id } }
    assert_redirected_to user_event_award_url(@user_event_award)
  end

  test "should destroy user_event_award" do
    assert_difference("UserEventAward.count", -1) do
      delete user_event_award_url(@user_event_award)
    end

    assert_redirected_to user_event_awards_url
  end
end
