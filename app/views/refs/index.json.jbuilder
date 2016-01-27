json.array!(@refs) do |ref|
  json.extract! ref, :id, :name, :desc, :pu_ht, :tva
  json.url ref_url(ref, format: :json)
end
