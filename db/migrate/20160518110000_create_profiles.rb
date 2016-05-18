class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :age
      t.string :cancer_type
      t.integer :sex
      t.string :time_since_diagnosis
      t.boolean :received_chemotherapy
      t.boolean :received_radiation_therapy
      t.boolean :active_cancer
      t.boolean :metastatic_cancer
      t.boolean :receiving_cancer_treatment
      t.boolean :has_kidney_disease
      t.boolean :has_liver_disease
      t.boolean :has_congestive_heart_failure
      t.boolean :has_atrial_fibrillation
      t.boolean :has_dementia
      t.boolean :cannot_maintain_balance
      t.boolean :has_diabetes
      t.boolean :increased_bowel_obstruction_risk

      t.timestamps null: false
    end
  end
end
