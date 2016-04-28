class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.string :name
      t.string :state
      t.string :number
      t.string :dba
      t.string :phone
      t.string :email
      t.integer :wholesale_id
      t.integer :wholesale_rep_id
      t.integer :retail_id
      t.integer :retail_rep_id
      t.integer :uw_id
      t.integer :mgu_id
      t.integer :program_id

      t.timestamps null: false
    end
  end
end
