require 'test_helper'

class IsbsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @isb = isbs(:one)
  end

  test "should get index" do
    get isbs_url
    assert_response :success
  end

  test "should get new" do
    get new_isb_url
    assert_response :success
  end

  test "should create isb" do
    assert_difference('Isb.count') do
      post isbs_url, params: { isb: { isa_id_id: @isb.isa_id_id, name: @isb.name } }
    end

    assert_redirected_to isb_url(Isb.last)
  end

  test "should show isb" do
    get isb_url(@isb)
    assert_response :success
  end

  test "should get edit" do
    get edit_isb_url(@isb)
    assert_response :success
  end

  test "should update isb" do
    patch isb_url(@isb), params: { isb: { isa_id_id: @isb.isa_id_id, name: @isb.name } }
    assert_redirected_to isb_url(@isb)
  end

  test "should destroy isb" do
    assert_difference('Isb.count', -1) do
      delete isb_url(@isb)
    end

    assert_redirected_to isbs_url
  end
end
