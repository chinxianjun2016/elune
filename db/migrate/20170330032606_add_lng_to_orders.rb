class AddLngToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :lng, :float  #坐标经度
    add_column :orders, :lat, :float  #坐标纬度
  end
end
