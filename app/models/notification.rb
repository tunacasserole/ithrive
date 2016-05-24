class Notification < ActiveRecord::Base
  belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  belongs_to :recipient, :class_name => "User", :foreign_key => "recipient_id"
  belongs_to :thriver, :class_name => "User", :foreign_key => "thriver_id"

  after_initialize :defaults
  after_save :send_broadcast, if: :broadcast?

  scope :unread, -> { where(state: 'new') }
  scope :sorted, -> { order(created_at: :desc) }
  scope :broadcast, -> { where(type_of: 'broadcast') }

  def summary
    self.body.truncate 30, :separator => /\w/
  end

  def read?
    state != 'new'
  end

  def broadcast?
    state == 'broadcast'
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

  def thriver_display
    self.thriver ? self.thriver.name : 'System Administrator'
  end

  def sender_display
    self.sender ? self.sender.name : 'System Administrator'
  end

  def send_broadcast
    User.all.each do |u|
      Notification.create(recipient_id: u.id, type_of: 'broadcast', state: 'new', body: self.body)
    end
    self.update_attributes(state: 'read')
  end

  protected
    def defaults
      self.state = 'new' unless state
    end

end
