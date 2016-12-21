json.extract! item, :id, :skuid, :description, :price, :length, :width, :height, :weight, :multiple, :profitable, :created_at, :updated_at
json.url item_url(item, format: :json)