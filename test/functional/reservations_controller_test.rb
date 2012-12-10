require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count') do
      post :create, reservation: { name: @reservation.name, number_of_tables: @reservation.number_of_tables, order_id: @reservation.order_id, phone: @reservation.phone, start_date: @reservation.start_date, user_id: @reservation.user_id }
    end

    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should show reservation" do
    get :show, id: @reservation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservation
    assert_response :success
  end

  test "should update reservation" do
    put :update, id: @reservation, reservation: { name: @reservation.name, number_of_tables: @reservation.number_of_tables, order_id: @reservation.order_id, phone: @reservation.phone, start_date: @reservation.start_date, user_id: @reservation.user_id }
    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', -1) do
      delete :destroy, id: @reservation
    end

    assert_redirected_to reservations_path
  end
end
