require 'test_helper'

class ProductPersonalWhishListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pwl = product_personal_whish_lists(:one)
  end

  test "should get index" do
    get product_personal_whish_lists_path(personal_whish_list: 1)
    
    categories = @controller.view_assigns['categories']
    products = @controller.view_assigns['products']
    whish_list_product_selected = @controller.view_assigns['selected_products']
    p whish_list_product_selected
    assert_not_nil categories
    assert_not_nil products
    assert_response :success
  end

  # test "should get new" do
  #   get new_product_personal_whish_list_url
  #   assert_response :success
  # end

  # test "should create pwl" do
  #   assert_difference('ProductPersonalWhishList.count') do
  #     post product_personal_whish_lists_url, params: { pwl: { Product: @pwl.Product, personal_wish_list: @pwl.personal_wish_list_id, product: @pwl.product } }
  #   end

  #   assert_redirected_to product_personal_whish_list_url(ProductPersonalWhishList.last)
  # end

  # test "should show pwl" do
  #   get product_personal_whish_list_url(@pwl)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_product_personal_whish_list_url(@pwl)
  #   assert_response :success
  # end

  # test "should update pwl" do
  #   patch product_personal_whish_list_url(@pwl), params: { pwl: { Product: @pwl.Product, personal_wish_list: @pwl.personal_wish_list, product: @pwl.product } }
  #   assert_redirected_to product_personal_whish_list_url(@pwl)
  # end

  # test "should destroy pwl" do
  #   assert_difference('ProductPersonalWhishList.count', -1) do
  #     delete product_personal_whish_list_url(@pwl)
  #   end

  #   assert_redirected_to product_personal_whish_lists_url
  # end
end
