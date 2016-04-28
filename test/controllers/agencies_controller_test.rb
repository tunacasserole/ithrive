require 'test_helper'

class AgenciesControllerTest < ActionController::TestCase
  setup do
    @agency = agencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agency" do
    assert_difference('Agency.count') do
      post :create, agency: { address1: @agency.address1, address2: @agency.address2, dba: @agency.dba, display_name: @agency.display_name, email: @agency.email, fax: @agency.fax, id: @agency.id, name: @agency.name, phone: @agency.phone, type_of: @agency.type_of, zip: @agency.zip }
    end

    assert_redirected_to agency_path(assigns(:agency))
  end

  test "should show agency" do
    get :show, id: @agency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agency
    assert_response :success
  end

  test "should update agency" do
    patch :update, id: @agency, agency: { address1: @agency.address1, address2: @agency.address2, dba: @agency.dba, display_name: @agency.display_name, email: @agency.email, fax: @agency.fax, id: @agency.id, name: @agency.name, phone: @agency.phone, type_of: @agency.type_of, zip: @agency.zip }
    assert_redirected_to agency_path(assigns(:agency))
  end

  test "should destroy agency" do
    assert_difference('Agency.count', -1) do
      delete :destroy, id: @agency
    end

    assert_redirected_to agencies_path
  end
end
