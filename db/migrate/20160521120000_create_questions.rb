class CreateQuestions < ActiveRecord::Migration
  create_table :questions do |t|
    t.integer :tenant_id
    t.string :name
    t.string :sequence
    t.string :type_of
    t.string :section
    t.string :strategy
    t.string :notify_text
    t.string :recipients
    t.boolean :do_notify
    t.boolean :is_filter
    t.boolean :is_required
    t.timestamps null: false
  end


end
