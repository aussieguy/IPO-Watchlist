require "test_helper"

class AsxlistingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asxlisting = asxlistings(:one)
  end

  test "should get index" do
    get asxlistings_url
    assert_response :success
  end

  test "should get new" do
    get new_asxlisting_url
    assert_response :success
  end

  test "should create asxlisting" do
    assert_difference("Asxlisting.count") do
      post asxlistings_url, params: { asxlisting: { code: @asxlisting.code, company: @asxlisting.company, currentPrice: @asxlisting.currentPrice, date: @asxlisting.date, listingPrice: @asxlisting.listingPrice } }
    end

    assert_redirected_to asxlisting_url(Asxlisting.last)
  end

  test "should show asxlisting" do
    get asxlisting_url(@asxlisting)
    assert_response :success
  end

  test "should get edit" do
    get edit_asxlisting_url(@asxlisting)
    assert_response :success
  end

  test "should update asxlisting" do
    patch asxlisting_url(@asxlisting), params: { asxlisting: { code: @asxlisting.code, company: @asxlisting.company, currentPrice: @asxlisting.currentPrice, date: @asxlisting.date, listingPrice: @asxlisting.listingPrice } }
    assert_redirected_to asxlisting_url(@asxlisting)
  end

  test "should destroy asxlisting" do
    assert_difference("Asxlisting.count", -1) do
      delete asxlisting_url(@asxlisting)
    end

    assert_redirected_to asxlistings_url
  end
end
