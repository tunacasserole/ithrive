json.array!(@agencies) do |agency|
  json.extract! agency, :id, :id, :type_of, :name, :dba, :display_name, :address1, :address2, :zip, :email, :phone, :fax
  json.url agency_url(agency, format: :json)
end
