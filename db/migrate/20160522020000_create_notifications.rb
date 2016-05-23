class CreateNotifications < ActiveRecord::Migration
  create_table :notifications do |t|
    t.integer :user_id
    t.integer :subject_id
    t.string :content
    t.string :kind
    t.string :state
    t.timestamps null: false
  end
end
