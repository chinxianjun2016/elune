class Order < ApplicationRecord
  # belongs_to :team

  def imported_orders
    @imported_orders ||= load_imported_orders
  end

  def load_imported_orders
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    header2column = ["id", "info_no", "lading_no", "create_time", "customer", "area_code", "phone", "province", "city",
                     "county", "street", "address", "category", "count", "uncount", "purchase_date", "customer_attribute",
                     "sale_type", "sale_no", "sale_name", "expected_time", "create_network_no", "create_network",
                     "service_date", "service_network_no", "service_network", "status", "note", "other_note",
                     "finished_time", "item_type", "item_count", "item_price", "item_type2", "item_count2", "item_price2",
                     "item_type3", "item_count3", "item_price3"]
    (3..spreadsheet.last_row).map do |i|
      row = Hash[header2column, spreadsheet.row(i).transpose]
      order = Order.find_by(lading_no: row["id"]) || Order.new
      # order = Order.new
      order.attributes = row.to_hash.slice(*row.to_hash.keys)
      order.lng = BaiduMap.geocoder(address: row["address"])["result"]["location"]["lng"]
      order.lat = BaiduMap.geocoder(address: row["address"])["result"]["location"]["lat"]
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

  def self.like(status, like)
    Order.where("status=? lading_no LIKE ? OR customer LIKE ? OR item_type LIKE ? OR sale_name LIKE ? OR address LIKE ? OR phone ? OR note LIKE ?",
                status, "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%")
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    # header = spreadsheet.row(1)
    header2column = ["id", "info_no", "lading_no", "create_time", "customer", "area_code", "phone", "province", "city",
                     "county", "street", "address", "category", "count", "uncount", "purchase_date", "customer_attribute",
                     "sale_type", "sale_no", "sale_name", "expected_time", "create_network_no", "create_network",
                     "service_date", "service_network_no", "service_network", "status", "note", "other_note",
                     "finished_time", "item_type", "item_count", "item_price", "item_type2", "item_count2", "item_price2",
                     "item_type3", "item_count3", "item_price3"]
    (3..spreadsheet.last_row).map do |i|
      row = Hash[[header2column, spreadsheet.row(i)].transpose]
      unless Order.find_by(lading_no: row["lading_no"])
        order = Order.new
        order.attributes = row.to_hash.slice(*row.to_hash.keys)
        if Order.find_by(id: row["id"])
          order.id = Order.last.id + 1
        elsif  Order.last.id > row["id"]
          order.id = Order.last.id + 1
        end
        order.lng = BaiduMap.geocoder(address: row["address"])["result"]["location"]["lng"]
        order.lat = BaiduMap.geocoder(address: row["address"])["result"]["location"]["lat"]
        order.save!
      end
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

  def self.dispatch
    Order.where("status = '网点已派工'")
  end
end
