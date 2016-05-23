class CreateHealthAttributes < ActiveRecord::Migration
  create_table :health_attributes do |t|
    t.integer :tenant_id
    t.string :name
    t.string :sequence
    t.boolean :is_filter
    t.boolean :notify
    t.string :notify_text
    t.string :recipients
    t.timestamps null: false
  end
end
