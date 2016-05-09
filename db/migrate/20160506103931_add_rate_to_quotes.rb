class AddRateToQuotes < ActiveRecord::Migration
  def change
      add_column :quotes, :premium, :decimal, precision: 8, scale: 2
      add_column :quotes, :program_fee, :decimal, precision: 8, scale: 2
      add_column :quotes, :inspection_fee, :decimal, precision: 8, scale: 2
      add_column :quotes, :surplus_lines_tax, :decimal, precision: 8, scale: 2
      add_column :quotes, :stamping_fee, :decimal, precision: 8, scale: 2
      add_column :quotes, :total_policy_cost, :decimal, precision: 8, scale: 2
  end
end
