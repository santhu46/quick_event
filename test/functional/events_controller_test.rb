require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @event = events(:one)
  end

  test "should get index" do
    get :index, :user_id => @user
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new, :user_id => @user
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, :user_id => @user, :event => @event.attributes
    end

    assert_redirected_to user_event_path(@user, assigns(:event))
  end

  test "should show event" do
    get :show, :user_id => @user, :id => @event.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :user_id => @user, :id => @event.to_param
    assert_response :success
  end

  test "should update event" do
    put :update, :user_id => @user, :id => @event.to_param, :event => @event.attributes
    assert_redirected_to user_event_path(@user, assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, :user_id => @user, :id => @event.to_param
    end

    assert_redirected_to user_events_path(@user)
  end
end
