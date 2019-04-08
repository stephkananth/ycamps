json.extract! camper, :id, :parent_id, :first_name, :last_name, :active, :created_at, :updated_at
json.url camper_url(camper, format: :json)
