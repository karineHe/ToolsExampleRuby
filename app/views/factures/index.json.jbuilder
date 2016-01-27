json.array!(@factures) do |facture|
  json.extract! facture, :id
  json.url facture_url(facture, format: :json)
end
