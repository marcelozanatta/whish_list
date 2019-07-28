require "application_system_test_case"

class ProductPersonalWhishListsTest < ApplicationSystemTestCase
  setup do
    @product_personal_whish_list = product_personal_whish_lists(:one)
  end

  test "visiting the index" do
    visit product_personal_whish_lists_url
    assert_selector "h1", text: "Product Personal Whish Lists"
  end

  test "creating a Product personal whish list" do
    visit product_personal_whish_lists_url
    click_on "New Product Personal Whish List"

    fill_in "Product", with: @product_personal_whish_list.Product
    fill_in "Personal wish list", with: @product_personal_whish_list.personal_wish_list
    fill_in "Product", with: @product_personal_whish_list.product
    click_on "Create Product personal whish list"

    assert_text "Product personal whish list was successfully created"
    click_on "Back"
  end

  test "updating a Product personal whish list" do
    visit product_personal_whish_lists_url
    click_on "Edit", match: :first

    fill_in "Product", with: @product_personal_whish_list.Product
    fill_in "Personal wish list", with: @product_personal_whish_list.personal_wish_list
    fill_in "Product", with: @product_personal_whish_list.product
    click_on "Update Product personal whish list"

    assert_text "Product personal whish list was successfully updated"
    click_on "Back"
  end

  test "destroying a Product personal whish list" do
    visit product_personal_whish_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product personal whish list was successfully destroyed"
  end
end
