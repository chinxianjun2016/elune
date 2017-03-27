class Order < ApplicationRecord
  # belongs_to :team

  def imported_orders
    @imported_orders ||= load_imported_orders
  end

  def load_imported_orders
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    header2column = ["service_date", "network_date", "appointment", "record_no", "lading_no", "customer", "area", "sales", "address", "telephone", "phone", "purchase_date", "demand", "item_name", "count", "network", "installer", "received_count", "receiving_date", "receipt_audit", "reviewer", "installation_date", "inside_no", "outlet_no", "invoice_no", "year", "month", "stage", "card_audit", "card_auditor", "installer_s", "completion_note", "sub_file_no"]
    (2..spreadsheet.last_row).map do |i|
      row = Hash[header2column, spreadsheet.row(i).transpose]
      order = Order.find_by(lading_no: row["id"]) || Order.new
      # order = Order.new
      order.attributes = row.to_hash.slice(*row.to_hash.keys)
      order.save!
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
      when  ".csv" then Csv.new(file.path, nil, :ignore)
      when  ".xls" then Excel.new(file.path)
      when  ".xlsx" then Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    # header = spreadsheet.row(1)
    header2column = ["service_date", "network_date", "appointment", "record_no", "lading_no", "customer", "area", "sales", "address", "telephone", "phone", "purchase_date", "demand", "item_name", "count", "network", "installer", "received_count", "receiving_date", "receipt_audit", "reviewer", "installation_date", "inside_no", "outlet_no", "invoice_no", "year", "month", "stage", "card_audit", "card_auditor", "installer_s", "completion_note", "sub_file_no"]
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header2column, spreadsheet.row(i)].transpose]
      order = Order.find_by(lading_no: row["id"]) || Order.new
      # order = Order.new
      order.attributes = row.to_hash.slice(*row.to_hash.keys)
      order.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when  ".csv" then Roo::Csv.new(file.path, nil, :ignore)
      when  ".xls" then Roo::Excel.new(file.path)
      when  ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
