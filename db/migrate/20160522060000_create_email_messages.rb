class CreateEmailMessages < ActiveRecord::Migration
  create_table :email_messages do |t|
    t.integer :tenant_id
    t.string :from
    t.string :to
    t.string :cc
    t.string :bcc
    t.string :subject
    t.string :body
    t.string :type_of
    t.string :state
    t.timestamps null: false
  end
end
