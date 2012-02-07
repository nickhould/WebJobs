require 'test_helper'

class ScrappersControllerTest < ActionController::TestCase
  setup do
    @scrapper = scrappers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scrappers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scrapper" do
    assert_difference('Scrapper.count') do
      post :create, :scrapper => @scrapper.attributes
    end

    assert_redirected_to scrapper_path(assigns(:scrapper))
  end

  test "should show scrapper" do
    get :show, :id => @scrapper.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @scrapper.to_param
    assert_response :success
  end

  test "should update scrapper" do
    put :update, :id => @scrapper.to_param, :scrapper => @scrapper.attributes
    assert_redirected_to scrapper_path(assigns(:scrapper))
  end

  test "should destroy scrapper" do
    assert_difference('Scrapper.count', -1) do
      delete :destroy, :id => @scrapper.to_param
    end

    assert_redirected_to scrappers_path
  end
end
