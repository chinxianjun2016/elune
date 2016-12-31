json.extract! item, :id, :name, :model, :count, :serial, :price, :description, :created_at, :updated_at
json.url item_url(item, format: :json)