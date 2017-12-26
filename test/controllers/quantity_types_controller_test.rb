require 'test_helper'

class QuantityTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quantity_type = quantity_types(:one)
  end

  test "should get index" do
    get quantity_types_url
    assert_response :success
  end

  test "should get new" do
    get new_quantity_type_url
    assert_response :success
  end

  test "should create quantity_type" do
    assert_difference('QuantityType.count') do
      post quantity_types_url, params: { quantity_type: { name: @quantity_type.name, quantity: @quantity_type.quantity } }
    end

    assert_redirected_to quantity_type_url(QuantityType.last)
  end

  test "should show quantity_type" do
    get quantity_type_url(@quantity_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_quantity_type_url(@quantity_type)
    assert_response :success
  end

  test "should update quantity_type" do
    patch quantity_type_url(@quantity_type), params: { quantity_type: { name: @quantity_type.name, quantity: @quantity_type.quantity } }
    assert_redirected_to quantity_type_url(@quantity_type)
  end

  test "should destroy quantity_type" do
    assert_difference('QuantityType.count', -1) do
      delete quantity_type_url(@quantity_type)
    end

    assert_redirected_to quantity_types_url
  end
end
