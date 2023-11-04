require "application_system_test_case"

class ListingsTest < ApplicationSystemTestCase
  setup do
    @listing = listings(:one)
  end

  test "visiting the index" do
    visit listings_url
    assert_selector "h1", text: "Listings"
  end

  test "should create listing" do
    visit listings_url
    click_on "New listing"

    fill_in "Activities", with: @listing.activities
    fill_in "Capital", with: @listing.capital
    fill_in "Close", with: @listing.close
    fill_in "Code", with: @listing.code
    fill_in "Company", with: @listing.company
    fill_in "Contact", with: @listing.contact
    fill_in "Listingdate", with: @listing.listingDate
    fill_in "Price", with: @listing.price
    fill_in "Sharetype", with: @listing.shareType
    fill_in "Underwriter", with: @listing.underwriter
    click_on "Create Listing"

    assert_text "Listing was successfully created"
    click_on "Back"
  end

  test "should update Listing" do
    visit listing_url(@listing)
    click_on "Edit this listing", match: :first

    fill_in "Activities", with: @listing.activities
    fill_in "Capital", with: @listing.capital
    fill_in "Close", with: @listing.close
    fill_in "Code", with: @listing.code
    fill_in "Company", with: @listing.company
    fill_in "Contact", with: @listing.contact
    fill_in "Listingdate", with: @listing.listingDate
    fill_in "Price", with: @listing.price
    fill_in "Sharetype", with: @listing.shareType
    fill_in "Underwriter", with: @listing.underwriter
    click_on "Update Listing"

    assert_text "Listing was successfully updated"
    click_on "Back"
  end

  test "should destroy Listing" do
    visit listing_url(@listing)
    click_on "Destroy this listing", match: :first

    assert_text "Listing was successfully destroyed"
  end
end
