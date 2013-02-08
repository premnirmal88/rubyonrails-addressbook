require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do
    @entry = entries(:one)
    @update = { # added according to pg 94 of AWDWR
      :first_name  =>  "Barack",
      :last_name  =>  "Obama",
      :email  =>  "barack@demo.com"
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entry" do
    assert_difference('Entry.count') do
      #post :create, :entry => { :email => @entry.email, :first_name => @entry.first_name, :last_name => @entry.last_name }
      post :create, :entry => @update
    end

    assert_redirected_to entry_path(assigns(:entry))
  end

  test "should show entry" do
    get :show, :id => @entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @entry
    assert_response :success
  end

  test "should update entry" do
    put :update, :id => @entry, :entry => { :email => @entry.email, :first_name => @entry.first_name, :last_name => @entry.last_name }
    assert_redirected_to entry_path(assigns(:entry))
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete :destroy, :id => @entry
    end

    assert_redirected_to entries_path
  end
end
