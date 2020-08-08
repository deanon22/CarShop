json.extract! receipt, :id, :name, :receipt_files, :service_id, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
