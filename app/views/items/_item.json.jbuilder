json.extract! item, :id, :skuid, :description, :price, :length, :width, :height, :weight, :multiple, :created_at, :updated_at
json.url item_url(item, format: :json)