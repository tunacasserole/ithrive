require 'open-uri'

class Bot

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

  def fill_out_rapid_rater
    @browser.goto rater_url
    @browser.select_list(:name, "new_agency_id").select_value("3589")
    @browser.select_list(:name, "new_user_id").select_value("7670")
    @browser.text_field(name: 'applicant_company_name').set('TEST')
    @browser.select_list(:name, "applicant_state").select_value("CA")
    @browser.select_list(:name, "classification_id_1").select_value("11207")
    @browser.text_field(name: 'gross_receipts_1').set('30000')
    @browser.select_list(:name, "limit_requested").select_value("1000/1000/1000")
    @browser.select_list(:name, "sir_box").select_value("2500")
    @browser.select_list(:name, "loss_runs_available").select_value("Yes")
    @browser.select_list(:name, "years_as_current").select_value("5")
    @browser.select_list(:name, "years_experience").select_value("5")
    @browser.text_field(name: 'perc_subout').set('10')
    sleep 1
    @browser.text_field(name: 'broker_fee_box').set('50')
    @browser.text_field(name: 'placement_fee_box').set('50')
    @browser.button(alt: 'Get Rate').click
    sleep 1
  end

  def premium
    @browser.input(name: 'QuoteCharge1').value
  end

  def total_policy_cost
    @browser.input(name: 'QuoteCharge15').value
  end

  def get_rate
    headless = Headless.new
    headless.start
    @browser = Watir::Browser.new :phantomjs
    login
    fill_out_rapid_rater
  end

end
