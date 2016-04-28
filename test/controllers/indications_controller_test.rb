require 'test_helper'

class IndicationsControllerTest < ActionController::TestCase
  setup do
    @indication = indications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indication" do
    assert_difference('Indication.count') do
      post :create, indication: { address1: @indication.address1, address2: @indication.address2, approval_comments: @indication.approval_comments, city: @indication.city, dba: @indication.dba, description_of_operations: @indication.description_of_operations, effective_date: @indication.effective_date, email: @indication.email, employee_payroll: @indication.employee_payroll, expire_date: @indication.expire_date, fax: @indication.fax, gf_comments: @indication.gf_comments, gross_receipts_current: @indication.gross_receipts_current, insured_ops: @indication.insured_ops, limits: @indication.limits, limits_selected: @indication.limits_selected, mgu_id: @indication.mgu_id, name: @indication.name, owner_payroll: @indication.owner_payroll, pdf_natural_url: @indication.pdf_natural_url, pdf_tracking_url: @indication.pdf_tracking_url, phone: @indication.phone, placement_fee: @indication.placement_fee, rating_factor: @indication.rating_factor, retail_agency_id: @indication.retail_agency_id, state: @indication.state, state_code: @indication.state_code, sub_out_commercial: @indication.sub_out_commercial, sub_out_residential: @indication.sub_out_residential, total_payroll: @indication.total_payroll, type_al_requested: @indication.type_al_requested, type_of_contractor: @indication.type_of_contractor, underwriter_id: @indication.underwriter_id, wholesale_agency_id: @indication.wholesale_agency_id, zip: @indication.zip }
    end

    assert_redirected_to indication_path(assigns(:indication))
  end

  test "should show indication" do
    get :show, id: @indication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indication
    assert_response :success
  end

  test "should update indication" do
    patch :update, id: @indication, indication: { address1: @indication.address1, address2: @indication.address2, approval_comments: @indication.approval_comments, city: @indication.city, dba: @indication.dba, description_of_operations: @indication.description_of_operations, effective_date: @indication.effective_date, email: @indication.email, employee_payroll: @indication.employee_payroll, expire_date: @indication.expire_date, fax: @indication.fax, gf_comments: @indication.gf_comments, gross_receipts_current: @indication.gross_receipts_current, insured_ops: @indication.insured_ops, limits: @indication.limits, limits_selected: @indication.limits_selected, mgu_id: @indication.mgu_id, name: @indication.name, owner_payroll: @indication.owner_payroll, pdf_natural_url: @indication.pdf_natural_url, pdf_tracking_url: @indication.pdf_tracking_url, phone: @indication.phone, placement_fee: @indication.placement_fee, rating_factor: @indication.rating_factor, retail_agency_id: @indication.retail_agency_id, state: @indication.state, state_code: @indication.state_code, sub_out_commercial: @indication.sub_out_commercial, sub_out_residential: @indication.sub_out_residential, total_payroll: @indication.total_payroll, type_al_requested: @indication.type_al_requested, type_of_contractor: @indication.type_of_contractor, underwriter_id: @indication.underwriter_id, wholesale_agency_id: @indication.wholesale_agency_id, zip: @indication.zip }
    assert_redirected_to indication_path(assigns(:indication))
  end

  test "should destroy indication" do
    assert_difference('Indication.count', -1) do
      delete :destroy, id: @indication
    end

    assert_redirected_to indications_path
  end
end
