require 'test_helper'

class Content::HeritagesControllerTest < ActionController::TestCase
  setup do
    @content_heritage = content_heritages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_heritages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_heritage" do
    assert_difference('Content::Heritage.count') do
      post :create, content_heritage: { access_routes: @content_heritage.access_routes, alt: @content_heritage.alt, brief_history: @content_heritage.brief_history, description: @content_heritage.description, extention: @content_heritage.extention, geo_location: @content_heritage.geo_location, lat: @content_heritage.lat, lon: @content_heritage.lon, name: @content_heritage.name, perimeter: @content_heritage.perimeter }
    end

    assert_redirected_to content_heritage_path(assigns(:content_heritage))
  end

  test "should show content_heritage" do
    get :show, id: @content_heritage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_heritage
    assert_response :success
  end

  test "should update content_heritage" do
    put :update, id: @content_heritage, content_heritage: { access_routes: @content_heritage.access_routes, alt: @content_heritage.alt, brief_history: @content_heritage.brief_history, description: @content_heritage.description, extention: @content_heritage.extention, geo_location: @content_heritage.geo_location, lat: @content_heritage.lat, lon: @content_heritage.lon, name: @content_heritage.name, perimeter: @content_heritage.perimeter }
    assert_redirected_to content_heritage_path(assigns(:content_heritage))
  end

  test "should destroy content_heritage" do
    assert_difference('Content::Heritage.count', -1) do
      delete :destroy, id: @content_heritage
    end

    assert_redirected_to content_heritages_path
  end
end
