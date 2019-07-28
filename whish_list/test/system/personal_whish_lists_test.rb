require "application_system_test_case"

class PersonalWhishListsTest < ApplicationSystemTestCase
  setup do
    @personal_whish_list = personal_whish_lists(:one)
  end

  test "visiting the index" do
    visit personal_whish_lists_url
    assert_selector "h1", text: "Personal Whish Lists"
  end

  test "creating a Personal whish list" do
    visit personal_whish_lists_url
    click_on "New Personal Whish List"

    click_on "Create Personal whish list"

    assert_text "Personal whish list was successfully created"
    click_on "Back"
  end

  test "updating a Personal whish list" do
    visit personal_whish_lists_url
    click_on "Edit", match: :first

    click_on "Update Personal whish list"

    assert_text "Personal whish list was successfully updated"
    click_on "Back"
  end

  test "destroying a Personal whish list" do
    visit personal_whish_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personal whish list was successfully destroyed"
  end
end