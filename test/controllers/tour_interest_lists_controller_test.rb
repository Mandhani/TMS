require 'test_helper'

class TourInterestListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tour_interest_list = tour_interest_lists(:one)
  end

  test "should get index" do
    get tour_interest_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_tour_interest_list_url
    assert_response :success
  end

  test "should create tour_interest_list" do
    assert_difference('TourInterestList.count') do
      post tour_interest_lists_url, params: { tour_interest_list: { tour_id: @tour_interest_list.tour_id, user_id: @tour_interest_list.user_id } }
    end

    assert_redirected_to tour_interest_list_url(TourInterestList.last)
  end

  test "should show tour_interest_list" do
    get tour_interest_list_url(@tour_interest_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_tour_interest_list_url(@tour_interest_list)
    assert_response :success
  end

  test "should update tour_interest_list" do
    patch tour_interest_list_url(@tour_interest_list), params: { tour_interest_list: { tour_id: @tour_interest_list.tour_id, user_id: @tour_interest_list.user_id } }
    assert_redirected_to tour_interest_list_url(@tour_interest_list)
  end

  test "should destroy tour_interest_list" do
    assert_difference('TourInterestList.count', -1) do
      delete tour_interest_list_url(@tour_interest_list)
    end

    assert_redirected_to tour_interest_lists_url
  end
end
