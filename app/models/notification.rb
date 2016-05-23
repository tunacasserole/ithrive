class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject, class_name: 'User'

  after_initialize :defaults
  after_save :broadcast

  scope :unread, -> { where(state: 'new') }
  scope :sorted, -> { order(created_at: :desc) }
  scope :broadcast, -> { where(kind: 'broadcast') }

  def short_content
    self.content.truncate 30, :separator => /\w/
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

  def subject_display
    self.subject ? self.subject.name : 'System Administrator'
  end

  def broadcast
    if self.user_id.nil?
      User.all.each do |u|
        Notification.create(user_id: u.id, kind: 'broadcast', state: 'new', content: self.content)
      end
    end
  end

  protected
    def defaults
      state = 'new' unless state
    end

end
