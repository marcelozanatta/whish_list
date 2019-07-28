require 'test_helper'

class ProductPersonalWhishListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_personal_whish_list = product_personal_whish_lists(:one)
  end

  test "should get index" do
    get product_personal_whish_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_product_personal_whish_list_url
    assert_response :success
  end

  test "should create product_personal_whish_list" do
    assert_difference('ProductPersonalWhishList.count') do
      post product_personal_whish_lists_url, params: { product_personal_whish_list: { Product: @product_personal_whish_list.Product, personal_wish_list: @product_personal_whish_list.personal_wish_list, product: @product_personal_whish_list.product } }
    end

    assert_redirected_to product_personal_whish_list_url(ProductPersonalWhishList.last)
  end

  test "should show product_personal_whish_list" do
    get product_personal_whish_list_url(@product_personal_whish_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_personal_whish_list_url(@product_personal_whish_list)
    assert_response :success
  end

  test "should update product_personal_whish_list" do
    patch product_personal_whish_list_url(@product_personal_whish_list), params: { product_personal_whish_list: { Product: @product_personal_whish_list.Product, personal_wish_list: @product_personal_whish_list.personal_wish_list, product: @product_personal_whish_list.product } }
    assert_redirected_to product_personal_whish_list_url(@product_personal_whish_list)
  end

  test "should destroy product_personal_whish_list" do
    assert_difference('ProductPersonalWhishList.count', -1) do
      delete product_personal_whish_list_url(@product_personal_whish_list)
    end

    assert_redirected_to product_personal_whish_lists_url
  end
end
