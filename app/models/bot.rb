require 'open-uri'

class Bot

  def initialize(quote)
    @quote = quote
  end

  def login_url
    'http://binddesk.atminsurance.com/login/login.asp'
  end

  def rater_url
    'http://binddesk.atminsurance.com/RAPIDRATER/GUARDIAN/default.asp?'
  end

  def doc
    @doc ||= Nokogiri::HTML(open(url))
  end

  def username
    'quotes@binddesk.com'
  end

  def password
    'Binddesk2016'
  end

  def login
    @browser.goto login_url
    @browser.text_field(name: 'un').set('quotes@binddesk.com')
    @browser.text_field(name: 'pwd').set('Binddesk2016')
    @browser.send_keys :enter
    sleep 1
  end

  def fill_defaults
    @browser.goto rater_url
    @browser.select_list(:name, "new_agency_id").select_value("3589")
    @browser.select_list(:name, "new_user_id").select_value("7670")
    @browser.text_field(name: 'applicant_company_name').set("TEST")
    # @browser.text_field(name: 'effective_date').set('05/08/2016')
  end

  def fill_class_codes
    @browser.select_list(:name, "classification_id_1").select_value(@quote.cc1.partition(' ')[0]) if @quote.cc1
    @browser.select_list(:name, "classification_id_2").select_value(@quote.cc2.partition(' ')[0]) if @quote.cc2
    @browser.select_list(:name, "classification_id_3").select_value(@quote.cc3.partition(' ')[0]) if @quote.cc3
    @browser.select_list(:name, "classification_id_4").select_value(@quote.cc4.partition(' ')[0]) if @quote.cc4
    @browser.text_field(name: 'gross_receipts_1').set(@quote.cc1_receipts) if @quote.cc1_receipts
    @browser.text_field(name: 'gross_receipts_2').set(@quote.cc2_receipts) if @quote.cc2_receipts
    @browser.text_field(name: 'gross_receipts_3').set(@quote.cc3_receipts) if @quote.cc3_receipts
    @browser.text_field(name: 'gross_receipts_4').set(@quote.cc4_receipts) if @quote.cc4_receipts
  end

  def fill_coverage
    @browser.select_list(:name, "applicant_state").select_value(@quote.state_of_residence)
    @browser.select_list(:name, "limit_requested").select_value(@quote.limits)
    @browser.select_list(:name, "sir_box").select_value(@quote.self_insured_retentions)
    @browser.select_list(:name, "loss_runs_available").select_value(@quote.has_loss_runs ? 'Yes' : 'No')
    @browser.select_list(:name, "years_as_current").select_value(@quote.years_in_business)
    @browser.select_list(:name, "years_experience").select_value(@quote.years_in_trade)
    @browser.text_field(name: 'perc_subout').set(@quote.sub_out_percentage)
    sleep 1
    @browser.text_field(name: 'broker_fee_box').set(@quote.broker_fee)
    @browser.text_field(name: 'placement_fee_box').set(@quote.retail_producer_fee)
  end

  def fill_endorsements
    e=@quote.blanket_endorsements
    endorsement_value = GlobalConstants::ATM_BLANKET_ENDORSEMENTS.keep_if {|abe| e == abe[1]}[0][0]
    @browser.radio(:value => endorsement_value).set
    @browser.checkbox(:name => 'ind_ai_box').set if @quote.ai
    # @browser.checkbox(:name => 'ind_aio_box').set if @quote.ai_completed_ops_commercial #disabled
    @browser.checkbox(:name => 'ind_permit_box').set if @quote.ai_permit_endorsement
    @browser.checkbox(:name => 'ind_work_box').set if @quote.exclusion_work_for_association
    @browser.checkbox(:name => 'ind_entity_box').set if @quote.other_entity_exclusion
    @browser.checkbox(:name => 'ind_agg_box').set if @quote.per_project_aggregate
    @browser.checkbox(:name => 'ind_plex_box').set if @quote.plex_endorsement
    @browser.checkbox(:name => 'ind_pw_box').set if @quote.primary_wording
    @browser.checkbox(:name => 'ind_terrorism_box').set if @quote.terrorism
    @browser.checkbox(:name => 'ind_torch_box').set if @quote.torch_down
    @browser.checkbox(:name => 'ind_tract_box').set if @quote.tract_homes
    @browser.checkbox(:name => 'ind_ws_box').set if @quote.waiver
  end

  def fill_rapid_rater
    fill_defaults
    fill_class_codes
    fill_coverage
    fill_endorsements

    @browser.button(alt: 'Get Rate').click
    sleep 1
  end


  def premium
    @browser.input(name: 'QuoteCharge1').value
  end

  def total_policy_cost
    @browser.input(name: 'QuoteCharge15').value
  end

  def to_price(fee_string)
    fee_string
  end

  def extract_rates
    rates = []
    (1..15).each do |c|
      rates << @browser.input(name: "QuoteCharge#{c.to_s}").value unless [9,10,11,12,13,14].include? c
    end
    rates
  end

  def get_rates
    # headless = Headless.new
    # headless.start
    @browser = Watir::Browser.new
    login
    fill_rapid_rater
    extract_rates
  end

end
