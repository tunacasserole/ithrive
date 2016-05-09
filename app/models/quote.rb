class Quote < ActiveRecord::Base
  belongs_to  :user
  after_initialize :set_default_values

  validates :insured_name, :state_of_residence, :agency, :cc1, :cc1_receipts, :years_in_business, :years_in_trade, :effective_date, presence: true
  validates :cc1_receipts, :cc2_receipts, :cc3_receipts, :cc4_receipts, numericality: { allow_blank: true, greater_than: 0 }
  validates :years_in_trade, numericality: { only_integer: true, greater_than: 2 }
  validates :broker_fee, :retail_producer_fee, numericality: { allow_blank: true, greater_than: 0 }
  validates :sub_out_percentage, numericality: {  only_integer: true, allow_blank: true, greater_than: -1,  less_than: 101 }
  validate :atm_validations


  def set_default_values
    self.state = 'in progress' unless self.state
    self.effective_date = Date.today unless self.effective_date
    self.agency = 'BindDesk' unless self.agency
    self.limits = '1000/1000/1000' unless self.limits
    self.self_insured_retentions = '2500' unless self.self_insured_retentions
    self.sub_out_percentage = '0' unless self.sub_out_percentage
    self.blanket_endorsements = 'No Blanket' unless self.blanket_endorsements
  end

  def total_receipts
    total_receipts = self.cc1_receipts.to_i
    total_receipts += self.cc2_receipts.to_i if self.cc2_receipts
    total_receipts += self.cc3_receipts.to_i if self.cc3_receipts
    total_receipts += self.cc4_receipts.to_i if self.cc4_receipts
    return total_receipts
  end

  def invalid_endorsements
    self.blanket_endorsements == 'Blanket Additional Insured - Completed Ops - Commercial Work Only $250' && ai_completed_ops_commercial ||
    self.blanket_endorsements == 'Blanket Primary Wording Endorsement $250' && primary_wording ||
    self.blanket_endorsements == 'Blanket Waiver of Subrogation Endorsement $250' && waiver ||
    self.blanket_endorsements == 'Blanket Primary Wording plus Blanket Waiver of Subrogation $400' && primary_wording ||
    self.blanket_endorsements == 'Blanket Primary Wording plus Blanket Waiver of Subrogation $400' && waiver ||
    self.blanket_endorsements == 'Blanket Additional Insured - Completed Ops - Commercial Work Only plus Blanket Waiver of Subrogation $400' && ai_completed_ops_commercial ||
    self.blanket_endorsements == 'Blanket Additional Insured - Completed Ops - Commercial Work Only plus Blanket Waiver of Subrogation $400' && waiver ||
    self.blanket_endorsements == 'Blanket Additional Insured - Completed Ops - Commercial Work Only plus Blanket Primary Wording $400' && ai_completed_ops_commercial ||
    self.blanket_endorsements == 'Blanket Additional Insured - Completed Ops - Commercial Work Only plus Blanket Primary Wording $400' && primary_wording ||
    self.blanket_endorsements == 'Blanket Additional Insured - Completed Ops - Commercial Work Only plus Blanket Primary Wording plus Blanket Waiver of Subrogation $500' && ai_completed_ops_commercial ||
    self.blanket_endorsements == 'Blanket Additional Insured - Completed Ops - Commercial Work Only plus Blanket Primary Wording plus Blanket Waiver of Subrogation $500' && primary_wording ||
    self.blanket_endorsements == 'Blanket Additional Insured - Completed Ops - Commercial Work Only plus Blanket Primary Wording plus Blanket Waiver of Subrogation $500' && waiver
  end

  def atm_validations
    errors.add(:base, "At least one class code must be selected") if (cc1.nil? and cc2.nil? and cc3.nil? and cc4.nil?)
    errors.add(:base, "Same class code cannot be selected more than once.") if (cc1.present? and (cc1 == cc2 || cc1 == cc3 || cc1 == cc4)) || (cc2.present? and (cc2 == cc3 || cc2 == cc4)) || (cc3.present? and (cc3 == cc4))
    errors.add(:base, "Gross receipts must be entered for each selected class code") if (cc1.present? and cc1_receipts.nil?) || (cc2.present? and cc2_receipts.nil?) || (cc3.present? and cc3_receipts.nil?) || (cc4.present? and cc4_receipts.nil?)
    errors.add(:base, "Class code must be selected where gross receipts have been entered") if (cc1.blank? and cc1_receipts.present?) || (cc2.blank? and cc2_receipts.present?) || (cc3.blank? and cc3_receipts.present?) || (cc4.blank? and cc4_receipts.present?)
    errors.add(:base, "Total gross receipts should not be less than 20,000.") if total_receipts < 20000
    errors.add(:base, "Effective date cannot be in the past") if effective_date < Date.today
    errors.add(:base, "Old policy number and renewal loss free only apply to Guardian renewals") if (!is_guardian_renewal && (old_policy_number.present? || renewal_loss_free))
    errors.add(:base, "Additional endorsements not valid with the selected blanket endorsement") if invalid_endorsements
  end

end
