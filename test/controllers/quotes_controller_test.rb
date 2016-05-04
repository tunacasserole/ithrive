require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post :create, quote: { agency: @quote.agency, agent: @quote.agent, ai: @quote.ai, ai_completed_ops_commercial: @quote.ai_completed_ops_commercial, ai_permit_endorsement: @quote.ai_permit_endorsement, blanket_endorsements: @quote.blanket_endorsements, broker_fee: @quote.broker_fee, broker_fee: @quote.broker_fee, cc1: @quote.cc1, cc1_receipts: @quote.cc1_receipts, cc1_receipts: @quote.cc1_receipts, cc2: @quote.cc2, cc2_receipts: @quote.cc2_receipts, cc2_receipts: @quote.cc2_receipts, cc3: @quote.cc3, cc3_receipts: @quote.cc3_receipts, cc3_receipts: @quote.cc3_receipts, cc4: @quote.cc4, cc4_receipts: @quote.cc4_receipts, cc4_receipts: @quote.cc4_receipts, effective_date: @quote.effective_date, exclusion_work_for_association: @quote.exclusion_work_for_association, has_loss_runs: @quote.has_loss_runs, insured_name: @quote.insured_name, is_guardian_renewal: @quote.is_guardian_renewal, limits: @quote.limits, mga: @quote.mga, mga_contact: @quote.mga_contact, other_entity_exclusion: @quote.other_entity_exclusion, per_project_aggregate: @quote.per_project_aggregate, plex_endorsement: @quote.plex_endorsement, primary_wording: @quote.primary_wording, program: @quote.program, retail_producer_fee: @quote.retail_producer_fee, retail_producer_fee: @quote.retail_producer_fee, self_insured_retentions: @quote.self_insured_retentions, state_of_residence: @quote.state_of_residence, sub_out_percentage: @quote.sub_out_percentage, sub_out_percentage: @quote.sub_out_percentage, terrorism: @quote.terrorism, torch_down: @quote.torch_down, tract_homes: @quote.tract_homes, waiver: @quote.waiver, years_in_business: @quote.years_in_business, years_in_trade: @quote.years_in_trade }
    end

    assert_redirected_to quote_path(assigns(:quote))
  end

  test "should show quote" do
    get :show, id: @quote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quote
    assert_response :success
  end

  test "should update quote" do
    patch :update, id: @quote, quote: { agency: @quote.agency, agent: @quote.agent, ai: @quote.ai, ai_completed_ops_commercial: @quote.ai_completed_ops_commercial, ai_permit_endorsement: @quote.ai_permit_endorsement, blanket_endorsements: @quote.blanket_endorsements, broker_fee: @quote.broker_fee, broker_fee: @quote.broker_fee, cc1: @quote.cc1, cc1_receipts: @quote.cc1_receipts, cc1_receipts: @quote.cc1_receipts, cc2: @quote.cc2, cc2_receipts: @quote.cc2_receipts, cc2_receipts: @quote.cc2_receipts, cc3: @quote.cc3, cc3_receipts: @quote.cc3_receipts, cc3_receipts: @quote.cc3_receipts, cc4: @quote.cc4, cc4_receipts: @quote.cc4_receipts, cc4_receipts: @quote.cc4_receipts, effective_date: @quote.effective_date, exclusion_work_for_association: @quote.exclusion_work_for_association, has_loss_runs: @quote.has_loss_runs, insured_name: @quote.insured_name, is_guardian_renewal: @quote.is_guardian_renewal, limits: @quote.limits, mga: @quote.mga, mga_contact: @quote.mga_contact, other_entity_exclusion: @quote.other_entity_exclusion, per_project_aggregate: @quote.per_project_aggregate, plex_endorsement: @quote.plex_endorsement, primary_wording: @quote.primary_wording, program: @quote.program, retail_producer_fee: @quote.retail_producer_fee, retail_producer_fee: @quote.retail_producer_fee, self_insured_retentions: @quote.self_insured_retentions, state_of_residence: @quote.state_of_residence, sub_out_percentage: @quote.sub_out_percentage, sub_out_percentage: @quote.sub_out_percentage, terrorism: @quote.terrorism, torch_down: @quote.torch_down, tract_homes: @quote.tract_homes, waiver: @quote.waiver, years_in_business: @quote.years_in_business, years_in_trade: @quote.years_in_trade }
    assert_redirected_to quote_path(assigns(:quote))
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete :destroy, id: @quote
    end

    assert_redirected_to quotes_path
  end
end
