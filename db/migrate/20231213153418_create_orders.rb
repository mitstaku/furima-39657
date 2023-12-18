class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    unless table_exists?(:orders)  
      create_table :orders do |t|
        t.references :user,              null: false, foreign_key: true
        t.references :item,              null: false, foreign_key: true
        t.timestamps
      end
    end
  end
end
