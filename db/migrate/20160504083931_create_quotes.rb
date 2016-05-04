class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :program
      t.string :mga
      t.string :mga_contact
      t.string :agency
      t.string :agent
      t.string :insured_name
      t.string :state_of_residence
      t.string :cc1
      t.decimal :cc1_receipts, precision: 8, scale: 2
      t.string :cc2
      t.decimal :cc2_receipts, precision: 8, scale: 2
      t.string :cc3
      t.decimal :cc3_receipts, precision: 8, scale: 2
      t.string :cc4
      t.decimal :cc4_receipts, precision: 8, scale: 2
      t.string :limits
      t.string :self_insured_retentions
      t.boolean :has_loss_runs
      t.string :years_in_business
      t.string :years_in_trade
      t.boolean :is_guardian_renewal
      t.decimal :sub_out_percentage, precision: 8, scale: 2
      t.decimal :broker_fee, precision: 8, scale: 2
      t.decimal :retail_producer_fee, precision: 8, scale: 2
      t.date :effective_date
      t.string :blanket_endorsements
      t.boolean :ai
      t.boolean :ai_completed_ops_commercial
      t.boolean :ai_permit_endorsement
      t.boolean :exclusion_work_for_association
      t.boolean :other_entity_exclusion
      t.boolean :per_project_aggregate
      t.boolean :plex_endorsement
      t.boolean :primary_wording
      t.boolean :terrorism
      t.boolean :torch_down
      t.boolean :tract_homes
      t.boolean :waiver

      t.timestamps null: false
    end
  end
end
