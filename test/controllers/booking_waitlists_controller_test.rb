require 'test_helper'

class BookingWaitlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_waitlist = booking_waitlists(:one)
  end

  test "should get index" do
    get booking_waitlists_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_waitlist_url
    assert_response :success
  end

  test "should create booking_waitlist" do
    assert_difference('BookingWaitlist.count') do
      post booking_waitlists_url, params: { booking_waitlist: { booking_id: @booking_waitlist.booking_id, quantity: @booking_waitlist.quantity, tour_id: @booking_waitlist.tour_id } }
    end

    assert_redirected_to booking_waitlist_url(BookingWaitlist.last)
  end

  test "should show booking_waitlist" do
    get booking_waitlist_url(@booking_waitlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_waitlist_url(@booking_waitlist)
    assert_response :success
  end

  test "should update booking_waitlist" do
    patch booking_waitlist_url(@booking_waitlist), params: { booking_waitlist: { booking_id: @booking_waitlist.booking_id, quantity: @booking_waitlist.quantity, tour_id: @booking_waitlist.tour_id } }
    assert_redirected_to booking_waitlist_url(@booking_waitlist)
  end

  test "should destroy booking_waitlist" do
    assert_difference('BookingWaitlist.count', -1) do
      delete booking_waitlist_url(@booking_waitlist)
    end

    assert_redirected_to booking_waitlists_url
  end
end
