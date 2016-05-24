class SeedEmailMessages < ActiveRecord::Migration
  User.all.each do |u|
    2.times do |i|
      EmailMessage.create(
        recipient_id: u.id,
        subject: 'Welcome to iThrive!',
        body: "Dear #{u.display_name},\n
              Thanks for joining our wonderful program.  We hope you love it! \n
              Team, iThrive  "
        )
    end
  end
end
