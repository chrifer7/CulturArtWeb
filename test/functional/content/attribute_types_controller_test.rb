require 'test_helper'

class Content::AttributeTypesControllerTest < ActionController::TestCase
  setup do
    @content_attribute_type = content_attribute_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_attribute_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_attribute_type" do
    assert_difference('Content::AttributeType.count') do
      post :create, content_attribute_type: { description: @content_attribute_type.description, name: @content_attribute_type.name }
    end

    assert_redirected_to content_attribute_type_path(assigns(:content_attribute_type))
  end

  test "should show content_attribute_type" do
    get :show, id: @content_attribute_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_attribute_type
    assert_response :success
  end

  test "should update content_attribute_type" do
    put :update, id: @content_attribute_type, content_attribute_type: { description: @content_attribute_type.description, name: @content_attribute_type.name }
    assert_redirected_to content_attribute_type_path(assigns(:content_attribute_type))
  end

  test "should destroy content_attribute_type" do
    assert_difference('Content::AttributeType.count', -1) do
      delete :destroy, id: @content_attribute_type
    end

    assert_redirected_to content_attribute_types_path
  end
end
