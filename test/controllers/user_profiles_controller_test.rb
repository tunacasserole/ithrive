require 'test_helper'

class UserProfilesControllerTest < ActionController::TestCase
  setup do
    @user_profile = user_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_profile" do
    assert_difference('UserProfile.count') do
      post :create, user_profile: { address_1: @user_profile.address_1, address_2: @user_profile.address_2, city: @user_profile.city, facebook_user: @user_profile.facebook_user, first_name: @user_profile.first_name, last_name: @user_profile.last_name, mobile_number: @user_profile.mobile_number, phone_number: @user_profile.phone_number, postal_code: @user_profile.postal_code, state: @user_profile.state, twitter_handle: @user_profile.twitter_handle, user_id: @user_profile.user_id }
    end

    assert_redirected_to user_profile_path(assigns(:user_profile))
  end

  test "should show user_profile" do
    get :show, id: @user_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_profile
    assert_response :success
  end

  test "should update user_profile" do
    patch :update, id: @user_profile, user_profile: { address_1: @user_profile.address_1, address_2: @user_profile.address_2, city: @user_profile.city, facebook_user: @user_profile.facebook_user, first_name: @user_profile.first_name, last_name: @user_profile.last_name, mobile_number: @user_profile.mobile_number, phone_number: @user_profile.phone_number, postal_code: @user_profile.postal_code, state: @user_profile.state, twitter_handle: @user_profile.twitter_handle, user_id: @user_profile.user_id }
    assert_redirected_to user_profile_path(assigns(:user_profile))
  end

  test "should destroy user_profile" do
    assert_difference('UserProfile.count', -1) do
      delete :destroy, id: @user_profile
    end

    assert_redirected_to user_profiles_path
  end
end
