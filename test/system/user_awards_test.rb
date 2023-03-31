require "application_system_test_case"

class UserAwardsTest < ApplicationSystemTestCase
  setup do
    @user_award = user_awards(:one)
  end

  test "visiting the index" do
    visit user_awards_url
    assert_selector "h1", text: "User awards"
  end

  test "should create user award" do
    visit user_awards_url
    click_on "New user award"

    fill_in "Award", with: @user_award.award_id
    fill_in "User", with: @user_award.user_id
    click_on "Create User award"

    assert_text "User award was successfully created"
    click_on "Back"
  end

  test "should update User award" do
    visit user_award_url(@user_award)
    click_on "Edit this user award", match: :first

    fill_in "Award", with: @user_award.award_id
    fill_in "User", with: @user_award.user_id
    click_on "Update User award"

    assert_text "User award was successfully updated"
    click_on "Back"
  end

  test "should destroy User award" do
    visit user_award_url(@user_award)
    click_on "Destroy this user award", match: :first

    assert_text "User award was successfully destroyed"
  end
end
