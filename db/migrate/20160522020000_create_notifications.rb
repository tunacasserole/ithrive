class CreateNotifications < ActiveRecord::Migration
  create_table :notifications do |t|    #alert    broadcast
    t.integer :recipient_id             #tenant   thriver
    t.integer :sender_id                #system   tenant
    t.integer :thriver_id               #thriver  system
    t.string :body
    t.string :type_of
    t.string :state
    t.timestamps null: false
  end
end
