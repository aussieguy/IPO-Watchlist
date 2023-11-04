require "application_system_test_case"

class AsxlistingsTest < ApplicationSystemTestCase
  setup do
    @asxlisting = asxlistings(:one)
  end

  test "visiting the index" do
    visit asxlistings_url
    assert_selector "h1", text: "Asxlistings"
  end

  test "should create asxlisting" do
    visit asxlistings_url
    click_on "New asxlisting"

    fill_in "Code", with: @asxlisting.code
    fill_in "Company", with: @asxlisting.company
    fill_in "Currentprice", with: @asxlisting.currentPrice
    fill_in "Date", with: @asxlisting.date
    fill_in "Listingprice", with: @asxlisting.listingPrice
    click_on "Create Asxlisting"

    assert_text "Asxlisting was successfully created"
    click_on "Back"
  end

  test "should update Asxlisting" do
    visit asxlisting_url(@asxlisting)
    click_on "Edit this asxlisting", match: :first

    fill_in "Code", with: @asxlisting.code
    fill_in "Company", with: @asxlisting.company
    fill_in "Currentprice", with: @asxlisting.currentPrice
    fill_in "Date", with: @asxlisting.date
    fill_in "Listingprice", with: @asxlisting.listingPrice
    click_on "Update Asxlisting"

    assert_text "Asxlisting was successfully updated"
    click_on "Back"
  end

  test "should destroy Asxlisting" do
    visit asxlisting_url(@asxlisting)
    click_on "Destroy this asxlisting", match: :first

    assert_text "Asxlisting was successfully destroyed"
  end
end
