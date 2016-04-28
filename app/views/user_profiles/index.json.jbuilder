json.array!(@user_profiles) do |user_profile|
  json.extract! user_profile, :id, :user_id, :first_name, :last_name, :phone_number, :facebook_user, :twitter_handle, :address_1, :address_2, :city, :state, :postal_code, :mobile_number
  json.url user_profile_url(user_profile, format: :json)
end
