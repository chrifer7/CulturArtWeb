require 'test_helper'

class Content::AttributeValuesControllerTest < ActionController::TestCase
  setup do
    @content_attribute_value = content_attribute_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_attribute_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_attribute_value" do
    assert_difference('Content::AttributeValue.count') do
      post :create, content_attribute_value: { attribute_id: @content_attribute_value.attribute_id, description: @content_attribute_value.description, icon: @content_attribute_value.icon, name: @content_attribute_value.name }
    end

    assert_redirected_to content_attribute_value_path(assigns(:content_attribute_value))
  end

  test "should show content_attribute_value" do
    get :show, id: @content_attribute_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_attribute_value
    assert_response :success
  end

  test "should update content_attribute_value" do
    put :update, id: @content_attribute_value, content_attribute_value: { attribute_id: @content_attribute_value.attribute_id, description: @content_attribute_value.description, icon: @content_attribute_value.icon, name: @content_attribute_value.name }
    assert_redirected_to content_attribute_value_path(assigns(:content_attribute_value))
  end

  test "should destroy content_attribute_value" do
    assert_difference('Content::AttributeValue.count', -1) do
      delete :destroy, id: @content_attribute_value
    end

    assert_redirected_to content_attribute_values_path
  end
end
