json.array!(@email_messages) do |email_message|
  json.extract! email_message, :id
  json.url email_message_url(email_message, format: :json)
end
