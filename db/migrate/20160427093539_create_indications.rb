class CreateIndications < ActiveRecord::Migration
  def change
    create_table :indications do |t|
      t.integer :underwriter_id
      t.string :state
      t.date :effective_date
      t.date :expire_date
      t.integer :wholesale_agency_id
      t.integer :retail_agency_id
      t.integer :placement_fee
      t.integer :employee_payroll
      t.integer :owner_payroll
      t.integer :total_payroll
      t.boolean :sub_out_commercial
      t.boolean :sub_out_residential
      t.integer :gross_receipts_current
      t.string :description_of_operations
      t.string :type_of_contractor
      t.string :type_al_requested
      t.string :limits_selected
      t.string :insured_ops
      t.string :limits
      t.string :rating_factor
      t.string :dba
      t.string :name
      t.string :zip
      t.string :address1
      t.string :address2
      t.string :city
      t.string :email
      t.string :fax
      t.string :phone
      t.string :state_code
      t.string :gf_comments
      t.string :approval_comments
      t.string :pdf_natural_url
      t.string :pdf_tracking_url
      t.integer :mgu_id
      t.decimal :total_policy_cost, precision: 8, scale: 2
      t.timestamps null: false
    end
  end
end
