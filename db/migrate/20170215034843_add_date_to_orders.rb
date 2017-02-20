class AddDateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :service_date, :date
    add_column :orders, :network_date, :date
    add_column :orders, :appointment, :date
    add_column :orders, :record_no, :string
    add_column :orders, :area, :string
    add_column :orders, :received_count, :integer
    add_column :orders, :network, :string
    add_column :orders, :installer, :string
    add_column :orders, :receipt_audit, :string
    add_column :orders, :reviewer, :string
    add_column :orders, :invoice_no, :string
    add_column :orders, :year, :integer
    add_column :orders, :month, :integer
    add_column :orders, :stage, :string
    add_column :orders, :card_audit, :string
    add_column :orders, :card_auditor, :string
    add_column :orders, :installer_s, :string
    add_column :orders, :completion_note, :string
    add_column :orders, :sub_file_no, :string
  end
end
