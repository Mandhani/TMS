require "application_system_test_case"

class TourInterestListsTest < ApplicationSystemTestCase
  setup do
    @tour_interest_list = tour_interest_lists(:one)
  end

  test "visiting the index" do
    visit tour_interest_lists_url
    assert_selector "h1", text: "Tour Interest Lists"
  end

  test "creating a Tour interest list" do
    visit tour_interest_lists_url
    click_on "New Tour Interest List"

    fill_in "Tour", with: @tour_interest_list.tour_id
    fill_in "User", with: @tour_interest_list.user_id
    click_on "Create Tour interest list"

    assert_text "Tour interest list was successfully created"
    click_on "Back"
  end

  test "updating a Tour interest list" do
    visit tour_interest_lists_url
    click_on "Edit", match: :first

    fill_in "Tour", with: @tour_interest_list.tour_id
    fill_in "User", with: @tour_interest_list.user_id
    click_on "Update Tour interest list"

    assert_text "Tour interest list was successfully updated"
    click_on "Back"
  end

  test "destroying a Tour interest list" do
    visit tour_interest_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tour interest list was successfully destroyed"
  end
end
