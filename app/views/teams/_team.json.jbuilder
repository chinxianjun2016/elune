json.extract! team, :id, :name, :phone, :area, :status, :address, :created_at, :updated_at
json.url team_url(team, format: :json)