require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first) # fetch the first quote from the fixtures
  end

  test "Creating a new quote" do
    # when visiting the index we expect to see "Quotes" as title
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # when clicking on "New Quote" we expect to land on a page with
    # a page title of "New Quote"
    click_on "New Quote"
    assert_selector "h1", text: "New Quote"

    # when filling out the form and submitting it...
    fill_in "Name", with: "Ubuntu 22.04"
    click_on "Create quote"

    # ...we expect to be back on the index page with a new quote
    # called "Ubuntu 22.04"
    assert_selector "h1", text: "Quotes"
    assert_text "Ubuntu 22.04"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit quote"

    fill_in "Name", with: "Updated quote"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
