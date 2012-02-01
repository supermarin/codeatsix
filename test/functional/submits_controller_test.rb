require 'test_helper'

class SubmitsControllerTest < ActionController::TestCase
  setup do
    @submit = submits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submit" do
    assert_difference('Submit.count') do
      post :create, :submit => @submit.attributes
    end

    assert_redirected_to submit_path(assigns(:submit))
  end

  test "should show submit" do
    get :show, :id => @submit
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @submit
    assert_response :success
  end

  test "should update submit" do
    put :update, :id => @submit, :submit => @submit.attributes
    assert_redirected_to submit_path(assigns(:submit))
  end

  test "should destroy submit" do
    assert_difference('Submit.count', -1) do
      delete :destroy, :id => @submit
    end

    assert_redirected_to submits_path
  end
end
