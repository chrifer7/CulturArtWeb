require 'test_helper'

class Content::DocumentsControllerTest < ActionController::TestCase
  setup do
    @content_document = content_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_document" do
    assert_difference('Content::Document.count') do
      post :create, content_document: { description: @content_document.description, document_content_type: @content_document.document_content_type, document_file_name: @content_document.document_file_name, name: @content_document.name, url: @content_document.url }
    end

    assert_redirected_to content_document_path(assigns(:content_document))
  end

  test "should show content_document" do
    get :show, id: @content_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_document
    assert_response :success
  end

  test "should update content_document" do
    put :update, id: @content_document, content_document: { description: @content_document.description, document_content_type: @content_document.document_content_type, document_file_name: @content_document.document_file_name, name: @content_document.name, url: @content_document.url }
    assert_redirected_to content_document_path(assigns(:content_document))
  end

  test "should destroy content_document" do
    assert_difference('Content::Document.count', -1) do
      delete :destroy, id: @content_document
    end

    assert_redirected_to content_documents_path
  end
end
