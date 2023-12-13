class CreateDeliveryAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_addresses do |t|
      t.string     :zip_code,         null: false
      t.integer    :prefecture_id,    null: false
      t.string     :city,             null: false
      t.string     :street_address,   null: false
      t.string     :building_name,    null: false
      t.string     :telephone_number, null: false
      t.references :order,            null: false, foreign_key: true
      t.timestamps
    end
  end
end