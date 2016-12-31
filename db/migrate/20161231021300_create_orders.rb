class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :lading_no
      t.string :customer
      t.string :sales
      t.string :address
      t.string :telephone
      t.string :phone
      t.string :item_name
      t.string :demand
      t.date :purchase_date
      t.integer :count
      t.date :receiving_date
      t.date :installation_date
      t.string :inside_no
      t.string :outlet_no

      t.timestamps
    end
  end
end
