require "test_helper"

class ListingControllerTest < ActionDispatch::IntegrationTest
  test "should get company" do
    get listing_company_url
    assert_response :success
  end

  test "should get listingDate" do
    get listing_listingDate_url
    assert_response :success
  end

  test "should get contact" do
    get listing_contact_url
    assert_response :success
  end

  test "should get activities" do
    get listing_activities_url
    assert_response :success
  end

  test "should get price" do
    get listing_price_url
    assert_response :success
  end

  test "should get shareType" do
    get listing_shareType_url
    assert_response :success
  end

  test "should get code" do
    get listing_code_url
    assert_response :success
  end

  test "should get capital" do
    get listing_capital_url
    assert_response :success
  end

  test "should get close" do
    get listing_close_url
    assert_response :success
  end

  test "should get underwriter" do
    get listing_underwriter_url
    assert_response :success
  end
end
