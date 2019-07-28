require 'test_helper'

class PersonalWhishListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal_whish_list = personal_whish_lists(:one)
  end

  test "should get index" do
    get personal_whish_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_personal_whish_list_url
    assert_response :success
  end

  test "should create personal_whish_list" do
    assert_difference('PersonalWhishList.count') do
      post personal_whish_lists_url, params: { personal_whish_list: { name: @personal_whish_list.name } }
    end

    assert_redirected_to personal_whish_list_url(PersonalWhishList.last)
  end

  test "should show personal_whish_list" do
    get personal_whish_list_url(@personal_whish_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_personal_whish_list_url(@personal_whish_list)
    assert_response :success
  end

  test "should update personal_whish_list" do
    patch personal_whish_list_url(@personal_whish_list), params: { personal_whish_list: { name: @personal_whish_list.name } }
    assert_redirected_to personal_whish_list_url(@personal_whish_list)
  end

  test "should destroy personal_whish_list" do
    assert_difference('PersonalWhishList.count', -1) do
      delete personal_whish_list_url(@personal_whish_list)
    end

    assert_redirected_to personal_whish_lists_url
  end
end
