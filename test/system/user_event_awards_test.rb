require "application_system_test_case"

class UserEventAwardsTest < ApplicationSystemTestCase
  setup do
    @user_event_award = user_event_awards(:one)
  end

  test "visiting the index" do
    visit user_event_awards_url
    assert_selector "h1", text: "User event awards"
  end

  test "should create user event award" do
    visit user_event_awards_url
    click_on "New user event award"

    fill_in "Award", with: @user_event_award.award_id
    fill_in "Description", with: @user_event_award.description
    fill_in "Event", with: @user_event_award.event_id
    fill_in "User", with: @user_event_award.user_id
    click_on "Create User event award"

    assert_text "User event award was successfully created"
    click_on "Back"
  end

  test "should update User event award" do
    visit user_event_award_url(@user_event_award)
    click_on "Edit this user event award", match: :first

    fill_in "Award", with: @user_event_award.award_id
    fill_in "Description", with: @user_event_award.description
    fill_in "Event", with: @user_event_award.event_id
    fill_in "User", with: @user_event_award.user_id
    click_on "Update User event award"

    assert_text "User event award was successfully updated"
    click_on "Back"
  end

  test "should destroy User event award" do
    visit user_event_award_url(@user_event_award)
    click_on "Destroy this user event award", match: :first

    assert_text "User event award was successfully destroyed"
  end
end
