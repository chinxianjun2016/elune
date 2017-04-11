json.extract! order, :id, :customer, :phone, :address, :lading_no, :item_type, :note, :lng, :lat, :team_name
json.url order_url(order, format: :json)