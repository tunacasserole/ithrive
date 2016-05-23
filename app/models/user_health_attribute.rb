class UserHealthAttribute < ActiveRecord::Base
  belongs_to :user
  belongs_to :health_attribute

  after_create :notify, if: :notifiable?
  after_update :notify, if: :notifiable?

  protected
    def notify
      recipients.each do |r|
        Notification.create(user_id: r.id, thriver_id: self.user.id, kind: 'health_attribute', content: self.health_attribute.notify_text)
      end
    end

    def recipients
      [User.first]
    end

    def notifiable?
      self.answer == true && self.health_attribute.notify
    end

end
