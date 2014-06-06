require 'test_helper'

class Content::OverlayedImgsControllerTest < ActionController::TestCase
  setup do
    @content_overlayed_img = content_overlayed_imgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_overlayed_imgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_overlayed_img" do
    assert_difference('Content::OverlayedImg.count') do
      post :create, content_overlayed_img: { alt_img: @content_overlayed_img.alt_img, alt_user: @content_overlayed_img.alt_user, heritage_id: @content_overlayed_img.heritage_id, history: @content_overlayed_img.history, lat_img: @content_overlayed_img.lat_img, lat_user: @content_overlayed_img.lat_user, lon_img: @content_overlayed_img.lon_img, lon_user: @content_overlayed_img.lon_user, name: @content_overlayed_img.name, url: @content_overlayed_img.url }
    end

    assert_redirected_to content_overlayed_img_path(assigns(:content_overlayed_img))
  end

  test "should show content_overlayed_img" do
    get :show, id: @content_overlayed_img
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_overlayed_img
    assert_response :success
  end

  test "should update content_overlayed_img" do
    put :update, id: @content_overlayed_img, content_overlayed_img: { alt_img: @content_overlayed_img.alt_img, alt_user: @content_overlayed_img.alt_user, heritage_id: @content_overlayed_img.heritage_id, history: @content_overlayed_img.history, lat_img: @content_overlayed_img.lat_img, lat_user: @content_overlayed_img.lat_user, lon_img: @content_overlayed_img.lon_img, lon_user: @content_overlayed_img.lon_user, name: @content_overlayed_img.name, url: @content_overlayed_img.url }
    assert_redirected_to content_overlayed_img_path(assigns(:content_overlayed_img))
  end

  test "should destroy content_overlayed_img" do
    assert_difference('Content::OverlayedImg.count', -1) do
      delete :destroy, id: @content_overlayed_img
    end

    assert_redirected_to content_overlayed_imgs_path
  end
end
