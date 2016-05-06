class Quote < ActiveRecord::Base
  belongs_to  :user

  after_initialize :set_default_values
  before_save :run_validations

  # validates_numericality_of :total_receipts, :greater_than => 19999

  def set_default_values
    self.state = 'new'
  end

  def total_receipts

    total_receipts = self.cc1_receipts.to_i
    total_receipts += self.cc2_receipts.to_i if self.cc2_receipts
    total_receipts += self.cc3_receipts.to_i if self.cc3_receipts
    total_receipts += self.cc4_receipts.to_i if self.cc4_receipts
  end

  def run_validations
    # list validations here
  end

end
