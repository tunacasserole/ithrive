class SeedNotifications < ActiveRecord::Migration
  User.all.each do |u|
    5.times do
      Notification.create(
        recipient_id: u.id,
        type_of: 'broadcast',
        body: 'Welcome to iThrive!'
      )
    end
  end
end
