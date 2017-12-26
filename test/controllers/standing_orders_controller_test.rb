require 'test_helper'

class StandingOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @standing_order = standing_orders(:one)
  end

  test "should get index" do
    get standing_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_standing_order_url
    assert_response :success
  end

  test "should create standing_order" do
    assert_difference('StandingOrder.count') do
      post standing_orders_url, params: { standing_order: { is_active: @standing_order.is_active, quantity: @standing_order.quantity, week_day: @standing_order.week_day } }
    end

    assert_redirected_to standing_order_url(StandingOrder.last)
  end

  test "should show standing_order" do
    get standing_order_url(@standing_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_standing_order_url(@standing_order)
    assert_response :success
  end

  test "should update standing_order" do
    patch standing_order_url(@standing_order), params: { standing_order: { is_active: @standing_order.is_active, quantity: @standing_order.quantity, week_day: @standing_order.week_day } }
    assert_redirected_to standing_order_url(@standing_order)
  end

  test "should destroy standing_order" do
    assert_difference('StandingOrder.count', -1) do
      delete standing_order_url(@standing_order)
    end

    assert_redirected_to standing_orders_url
  end
end
