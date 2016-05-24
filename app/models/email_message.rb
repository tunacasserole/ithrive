class EmailMessage < ActiveRecord::Base
  after_initialize :defaults
  # after_save :send

  after_initialize :defaults

  scope :unread, -> { where(state: 'new') }
  scope :sorted, -> { order(created_at: :desc) }

  def summary
    self.body.truncate 30, :separator => /\w/
  end

  def read?
    state != 'new'
  end

  def mark_as_read
    self.update_attribute(:state,'read')
  end

  def today?
    created_at.to_date == Date.today
  end

  def received
    today? ? created_at.strftime('%R %p') : created_at.strftime('%D')
  end

  protected
    def defaults
      self.state = 'new' unless state
    end

end
