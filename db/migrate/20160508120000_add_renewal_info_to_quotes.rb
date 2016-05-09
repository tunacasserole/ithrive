class AddRenewalInfoToQuotes < ActiveRecord::Migration
  def change
      add_column :quotes, :old_policy_number, :string
      add_column :quotes, :renewal_loss_free, :boolean
  end
end
