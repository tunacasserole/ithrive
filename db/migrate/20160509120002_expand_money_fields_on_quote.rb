class ExpandMoneyFieldsOnQuote < ActiveRecord::Migration
  def change
    change_table :quotes do |t|
      t.change :cc1_receipts, :decimal, precision: 11, scale: 2
      t.change :cc2_receipts, :decimal, precision: 11, scale: 2
      t.change :cc3_receipts, :decimal, precision: 11, scale: 2
      t.change :cc4_receipts, :decimal, precision: 11, scale: 2
      t.change :broker_fee, :decimal, precision: 11, scale: 2
      t.change :retail_producer_fee, :decimal, precision: 11, scale: 2
      t.change :premium, :decimal, precision: 11, scale: 2
      t.change :program_fee, :decimal, precision: 11, scale: 2
      t.change :inspection_fee, :decimal, precision: 11, scale: 2
      t.change :surplus_lines_tax, :decimal, precision: 11, scale: 2
      t.change :stamping_fee, :decimal, precision: 11, scale: 2
      t.change :total_policy_cost, :decimal, precision: 11, scale: 2
    end
  end
end
