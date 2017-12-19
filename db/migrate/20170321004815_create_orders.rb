class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :info_no #信息编号
      t.string :lading_no  #销售单号/提货单号
      t.datetime :create_time #创建时间
      t.string :customer #联系人
      t.string :area_code #区号
      t.string :phone #联系电话
      t.string :province #省
      t.string :city #市
      t.string :county #县区
      t.string :street #街道
      t.string :address #详细地址
      t.string :category #品类
      t.integer :count #安装数量
      t.integer :uncount #未完工数量
      t.datetime :purchase_date #购买日期
      t.string :customer_attribute #用户属性
      t.string :sale_type #销售类型
      t.string :sale_no #销售单位编号
      t.string :sale_name #销售单位名称
      t.string :expected_time #期望上门时间
      t.string :create_network_no #创建网点编号
      t.string :create_network #创建网点名称
      t.datetime :service_date #首次派工时间
      t.string :service_network_no #服务网点编号
      t.string :service_network #服务网点名称
      t.string :status #派工状态: 待网点派工、网点已派工、待网点回访、派工已完工
      t.string :note #备注
      t.string :other_note #其他说明
      t.string :finished_time #完工时间
      t.string :item_type #型号1
      t.integer :item_count #数量1
      t.float :item_price #单价1
      t.string :item_type2 #型号2
      t.integer :item_count2 #数量2
      t.float :item_price2 #单价2
      t.string :item_type3 #型号3
      t.integer :item_count3 #数量3
      t.float :item_price3 #单价3
      t.datetime :dispatch_time #派工时间
      t.datetime :recall_time #回访时间
      t.string :recall_note #回访记录
      t.string :team_name #安装工名称
      t.string :team_phone #安装工电话

      t.timestamps
    end
  end
end
