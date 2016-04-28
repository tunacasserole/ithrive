class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :type_of
      t.string :name
      t.string :dba
      t.string :display_name
      t.string :address1
      t.string :address2
      t.string :zip
      t.string :email
      t.string :phone
      t.string :fax

      t.timestamps null: false
    end
  end
end
