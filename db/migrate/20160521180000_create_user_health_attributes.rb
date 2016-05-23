class CreateUserHealthAttributes < ActiveRecord::Migration
  create_table :user_health_attributes do |t|
    t.integer :user_id
    t.string :health_attribute_id
    t.boolean :answer
    t.timestamps null: false
  end
end
