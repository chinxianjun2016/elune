json.extract! order, :id, :customer, :telephone, :address, :lading_no, :item_name, :installation_date, :lng, :lat, :team_name
json.url order_url(order, format: :json)