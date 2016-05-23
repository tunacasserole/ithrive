class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :user, index: true, foreign_key: true
      t.references :survey, index: true, foreign_key: true
      t.text :response_record, null: false

      t.timestamps null: false
    end
  end
end
