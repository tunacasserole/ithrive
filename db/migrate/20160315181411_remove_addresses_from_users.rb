class RemoveAddressesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :phone_number, :string
    remove_column :users, :facebook_user, :string
    remove_column :users, :twitter_handle, :string
    remove_column :users, :address_1, :string
    remove_column :users, :address_2, :string
    remove_column :users, :city, :string
    remove_column :users, :state, :string
    remove_column :users, :postal_code, :string
    remove_column :users, :mobile_number, :string
  end
end
