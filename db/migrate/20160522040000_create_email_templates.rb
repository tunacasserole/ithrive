class CreateEmailTemplates < ActiveRecord::Migration
  create_table :email_templates do |t|
    t.integer :tenant_id
    t.string :name
    t.string :kind
    t.string :state
    t.string :to
    t.string :from
    t.string :cc
    t.string :bcc
    t.string :subject
    t.string :body
    t.boolean :is_default
    t.timestamps null: false
  end
end
