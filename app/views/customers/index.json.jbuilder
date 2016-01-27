json.array!(@companies) do |company|
  json.extract! company, :id, :name, :website, :phone, :fax, :email
  json.url company_url(company, format: :json)
end
