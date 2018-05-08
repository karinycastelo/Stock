json.extract! input, :id, :date, :datetime, :quantity, :item_id, :created_at, :updated_at
json.url input_url(input, format: :json)