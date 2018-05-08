json.extract! item, :id, :code, :name, :description, :patrimony, :type_id, :sector_id, :quantity, :user_id, :rent, :enterprise_id, :created_at, :updated_at
json.url item_url(item, format: :json)