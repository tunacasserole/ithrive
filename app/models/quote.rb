class Quote < ActiveRecord::Base
  belongs_to  :user

  after_initialize :set_default_values

  def set_default_values
    self.state = 'new'
  end



end
