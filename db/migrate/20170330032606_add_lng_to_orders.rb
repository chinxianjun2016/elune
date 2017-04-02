class AddLngToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :lng, :float
    add_column :orders, :lat, :float
  end
end
