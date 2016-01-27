json.array!(@contacts) do |contact|
  json.extract! contact, :id, :civ, :lname, :fname, :job, :address, :email, :phone, :cell, :fax
  json.url contact_url(contact, format: :json)
end
