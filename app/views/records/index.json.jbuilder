json.array!(@records) do |record|
  json.extract! record, :name, :description, :user_id
  json.url record_url(record, format: :json)
end
