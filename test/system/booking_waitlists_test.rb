require "application_system_test_case"

class BookingWaitlistsTest < ApplicationSystemTestCase
  setup do
    @booking_waitlist = booking_waitlists(:one)
  end

  test "visiting the index" do
    visit booking_waitlists_url
    assert_selector "h1", text: "Booking Waitlists"
  end

  test "creating a Booking waitlist" do
    visit booking_waitlists_url
    click_on "New Booking Waitlist"

    fill_in "Booking", with: @booking_waitlist.booking_id
    fill_in "Quantity", with: @booking_waitlist.quantity
    fill_in "Tour", with: @booking_waitlist.tour_id
    click_on "Create Booking waitlist"

    assert_text "Booking waitlist was successfully created"
    click_on "Back"
  end

  test "updating a Booking waitlist" do
    visit booking_waitlists_url
    click_on "Edit", match: :first

    fill_in "Booking", with: @booking_waitlist.booking_id
    fill_in "Quantity", with: @booking_waitlist.quantity
    fill_in "Tour", with: @booking_waitlist.tour_id
    click_on "Update Booking waitlist"

    assert_text "Booking waitlist was successfully updated"
    click_on "Back"
  end

  test "destroying a Booking waitlist" do
    visit booking_waitlists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Booking waitlist was successfully destroyed"
  end
end
