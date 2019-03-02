require "application_system_test_case"

class ToursTest < ApplicationSystemTestCase
  setup do
    @tour = tours(:one)
  end

  test "visiting the index" do
    visit tours_url
    assert_selector "h1", text: "Tours"
  end

  test "creating a Tour" do
    visit tours_url
    click_on "New Tour"

    fill_in "Booking deadline", with: @tour.booking_deadline
    fill_in "Contact", with: @tour.contact
    fill_in "Description", with: @tour.description
    fill_in "Duration end", with: @tour.duration_end
    fill_in "Duration start", with: @tour.duration_start
    fill_in "Itenary", with: @tour.itenary
    fill_in "Name", with: @tour.name
    fill_in "Price", with: @tour.price
    fill_in "Seats", with: @tour.seats
    fill_in "Start location", with: @tour.start_location
    fill_in "Status", with: @tour.status
    fill_in "Waitlist", with: @tour.waitlist
    click_on "Create Tour"

    assert_text "Tour was successfully created"
    click_on "Back"
  end

  test "updating a Tour" do
    visit tours_url
    click_on "Edit", match: :first

    fill_in "Booking deadline", with: @tour.booking_deadline
    fill_in "Contact", with: @tour.contact
    fill_in "Description", with: @tour.description
    fill_in "Duration end", with: @tour.duration_end
    fill_in "Duration start", with: @tour.duration_start
    fill_in "Itenary", with: @tour.itenary
    fill_in "Name", with: @tour.name
    fill_in "Price", with: @tour.price
    fill_in "Seats", with: @tour.seats
    fill_in "Start location", with: @tour.start_location
    fill_in "Status", with: @tour.status
    fill_in "Waitlist", with: @tour.waitlist
    click_on "Update Tour"

    assert_text "Tour was successfully updated"
    click_on "Back"
  end

  test "destroying a Tour" do
    visit tours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tour was successfully destroyed"
  end
end
