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
      t.date :service_date
      t.date :network_date
      t.date :appointment
      t.string :record_no
      t.string :area
      t.string :received_count
      t.string :network
      t.string :installer
      t.string :receipt_audit
      t.string :reviewer
      t.string :invoice_no
      t.integer :year
      t.integer :month
      t.string :stage
      t.string :card_audit
      t.string :card_auditor
      t.string :installer_s
      t.string :completion_note
      t.string :sub_file_no
      t.integer :status
      t.integer :team_id
      t.string :team_name
      t.string :team_phone

      t.timestamps
    end
  end
end
