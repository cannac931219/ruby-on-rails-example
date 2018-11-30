require 'test_helper'

class IsasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @isa = isas(:one)
  end

  test "should get index" do
    get isas_url
    assert_response :success
  end

  test "should get new" do
    get new_isa_url
    assert_response :success
  end

  test "should create isa" do
    assert_difference('Isa.count') do
      post isas_url, params: { isa: { name: @isa.name } }
    end

    assert_redirected_to isa_url(Isa.last)
  end

  test "should show isa" do
    get isa_url(@isa)
    assert_response :success
  end

  test "should get edit" do
    get edit_isa_url(@isa)
    assert_response :success
  end

  test "should update isa" do
    patch isa_url(@isa), params: { isa: { name: @isa.name } }
    assert_redirected_to isa_url(@isa)
  end

  test "should destroy isa" do
    assert_difference('Isa.count', -1) do
      delete isa_url(@isa)
    end

    assert_redirected_to isas_url
  end
end
