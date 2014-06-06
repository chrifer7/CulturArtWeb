require 'test_helper'

class Content::DataTypesControllerTest < ActionController::TestCase
  setup do
    @content_data_type = content_data_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_data_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_data_type" do
    assert_difference('Content::DataType.count') do
      post :create, content_data_type: { name: @content_data_type.name, ptype: @content_data_type.ptype }
    end

    assert_redirected_to content_data_type_path(assigns(:content_data_type))
  end

  test "should show content_data_type" do
    get :show, id: @content_data_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_data_type
    assert_response :success
  end

  test "should update content_data_type" do
    put :update, id: @content_data_type, content_data_type: { name: @content_data_type.name, ptype: @content_data_type.ptype }
    assert_redirected_to content_data_type_path(assigns(:content_data_type))
  end

  test "should destroy content_data_type" do
    assert_difference('Content::DataType.count', -1) do
      delete :destroy, id: @content_data_type
    end

    assert_redirected_to content_data_types_path
  end
end
