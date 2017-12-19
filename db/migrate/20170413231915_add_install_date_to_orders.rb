class AddInstallDateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :install_date, :date  #安装日期
    add_column :orders, :operator, :string  #操作员
    add_column :orders, :finished_date, :datetime   #完工时间
  end
end
