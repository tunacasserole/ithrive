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
    @browser.select_list(:name, "loss_runs_available").select_value('Yes') if @quote.has_loss_runs
    @browser.select_list(:name, "years_as_current").select_value(@quote.years_in_business)
    @browser.select_list(:name, "years_experience").select_value(@quote.years_in_trade)
    @browser.select_list(:name, "renewal_box").select_value('Yes') if @quote.is_guardian_renewal
    @browser.select_list(:name, "renewal_loss_free").select_value('Yes') if @quote.renewal_loss_free
    @browser.text_field(name: 'renewal_for').set(@quote.old_policy_number) if @quote.old_policy_number.present?
    @browser.text_field(name: 'perc_subout').set(@quote.sub_out_percentage) if @quote.sub_out_percentage > 0
    sleep 1
    @browser.text_field(name: 'broker_fee_box').set(@quote.broker_fee)
    @browser.text_field(name: 'placement_fee_box').set(@quote.retail_producer_fee)
  end

  def fill_endorsements
    e=@quote.blanket_endorsements
    unless e == 'No Blanket'
      endorsement_value = AtmConstants::BLANKET_ENDORSEMENTS.select {|abe| e == abe[1]}[0][0]
      @browser.radio(:value => endorsement_value).set
    end
    @browser.checkbox(:name => 'ind_ai_box').set if @quote.ai
    @browser.checkbox(:name => 'ind_aio_box').set if @quote.ai_completed_ops_commercial
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
  end

  def set_premium
    @browser.input(name: 'QuoteCharge1').value.gsub(',','_').split('$')[1].to_f
  end

  def set_total_policy_cost
    @browser.input(name: 'QuoteCharge15').value.gsub(',','_').split('$')[1].to_f
  end

  def to_price(fee_string)
    fee_string
  end

  def extract_rates
    rates = []
    rates << @browser.input(name: "QuoteCharge1").value if @browser.input(name: "QuoteCharge1").exists? # estimated annual premium
    rates << @browser.input(name: "QuoteCharge2").value if @browser.input(name: "QuoteCharge2").exists? # endorsement cost
    rates << @browser.input(name: "QuoteCharge3").value if @browser.input(name: "QuoteCharge3").exists? # program fee
    rates << @browser.input(name: "QuoteCharge4").value if @browser.input(name: "QuoteCharge4").exists? # inspection fee
    rates << @browser.input(name: "QuoteCharge5").value if @browser.input(name: "QuoteCharge5").exists? # surplus lines tax
    rates << @browser.input(name: "QuoteCharge6").value if @browser.input(name: "QuoteCharge6").exists? # broker fee or stamping fee
    rates << @browser.input(name: "QuoteCharge7").value if @browser.input(name: "QuoteCharge7").exists? # broker fee or retail producer fee
    rates << @browser.input(name: "QuoteCharge8").value if @browser.input(name: "QuoteCharge8").exists? # retail producer fee
    rates << @browser.input(name: "QuoteCharge15").value if @browser.input(name: "QuoteCharge15").exists?# total cost of policy
    rates
  end

  def get_rates
    # headless = Headless.new
    # headless.start
    @browser = Watir::Browser.new :phantomjs
    login
    fill_rapid_rater
    @browser.button(alt: 'Get Rate').click
    extract_rates
  end

end
