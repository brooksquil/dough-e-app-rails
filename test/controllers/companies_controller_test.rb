require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, params: { company: { billing_address_2: @company.billing_address_2, billing_state: @company.billing_state, billing_street_address: @company.billing_street_address, billing_zipcode: @company.billing_zipcode, company_email: @company.company_email, company_name: @company.company_name, company_phone: @company.company_phone, is_active: @company.is_active, payment_terms: @company.payment_terms, shipping_address: @company.shipping_address, shipping_address_2: @company.shipping_address_2, shipping_city: @company.shipping_city, shipping_notes: @company.shipping_notes, shipping_state: @company.shipping_state, shipping_zipcode: @company.shipping_zipcode } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { billing_address_2: @company.billing_address_2, billing_state: @company.billing_state, billing_street_address: @company.billing_street_address, billing_zipcode: @company.billing_zipcode, company_email: @company.company_email, company_name: @company.company_name, company_phone: @company.company_phone, is_active: @company.is_active, payment_terms: @company.payment_terms, shipping_address: @company.shipping_address, shipping_address_2: @company.shipping_address_2, shipping_city: @company.shipping_city, shipping_notes: @company.shipping_notes, shipping_state: @company.shipping_state, shipping_zipcode: @company.shipping_zipcode } }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end
