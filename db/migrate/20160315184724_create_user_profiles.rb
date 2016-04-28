class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :user_id
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :facebook_user
      t.string :twitter_handle
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :mobile_number

      t.timestamps null: false
    end
  end
end
