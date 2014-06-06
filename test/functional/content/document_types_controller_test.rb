require 'test_helper'

class Content::DocumentTypesControllerTest < ActionController::TestCase
  setup do
    @content_document_type = content_document_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_document_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_document_type" do
    assert_difference('Content::DocumentType.count') do
      post :create, content_document_type: { description: @content_document_type.description, icon: @content_document_type.icon, icon_content_type: @content_document_type.icon_content_type, icon_file_name: @content_document_type.icon_file_name, name: @content_document_type.name }
    end

    assert_redirected_to content_document_type_path(assigns(:content_document_type))
  end

  test "should show content_document_type" do
    get :show, id: @content_document_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_document_type
    assert_response :success
  end

  test "should update content_document_type" do
    put :update, id: @content_document_type, content_document_type: { description: @content_document_type.description, icon: @content_document_type.icon, icon_content_type: @content_document_type.icon_content_type, icon_file_name: @content_document_type.icon_file_name, name: @content_document_type.name }
    assert_redirected_to content_document_type_path(assigns(:content_document_type))
  end

  test "should destroy content_document_type" do
    assert_difference('Content::DocumentType.count', -1) do
      delete :destroy, id: @content_document_type
    end

    assert_redirected_to content_document_types_path
  end
end
