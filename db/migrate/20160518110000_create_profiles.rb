class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :tenant_id
      t.integer :sequence
      t.integer :question_id
      t.string :answer
      t.timestamps null: false

    end
  end
end
