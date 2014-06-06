require 'test_helper'

class Content::AttributesControllerTest < ActionController::TestCase
  setup do
    @content_attribute = content_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_attribute" do
    assert_difference('Content::Attribute.count') do
      post :create, content_attribute: { attribute_type_id: @content_attribute.attribute_type_id, data_type_id: @content_attribute.data_type_id, description: @content_attribute.description, name: @content_attribute.name }
    end

    assert_redirected_to content_attribute_path(assigns(:content_attribute))
  end

  test "should show content_attribute" do
    get :show, id: @content_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_attribute
    assert_response :success
  end

  test "should update content_attribute" do
    put :update, id: @content_attribute, content_attribute: { attribute_type_id: @content_attribute.attribute_type_id, data_type_id: @content_attribute.data_type_id, description: @content_attribute.description, name: @content_attribute.name }
    assert_redirected_to content_attribute_path(assigns(:content_attribute))
  end

  test "should destroy content_attribute" do
    assert_difference('Content::Attribute.count', -1) do
      delete :destroy, id: @content_attribute
    end

    assert_redirected_to content_attributes_path
  end
end
