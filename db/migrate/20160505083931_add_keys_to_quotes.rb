class AddKeysToQuotes < ActiveRecord::Migration
  def change
      add_column :quotes, :user_id, :string
      add_column :quotes, :state, :string
  end
end
