class SeedUsers < ActiveRecord::Migration
  emails = ['jason@buildit.io','britt@ithriveplan.com','lise@ithriveplan.com','karolyn@ithriveplan.com','mandisa@ithriveplan.com']
  # for console testing
  # e = 'aaron@buildit.io'
  # User.new(email: e, password: 'welcome1!', password_confirmation: 'welcome1!' ).save(false)
  emails.each { |e| User.new(email: e, password: 'Welcome1!', password_confirmation: 'Welcome1!', first_name: e.split('@')[0], last_name: 'Thriver' ).save! }
end
