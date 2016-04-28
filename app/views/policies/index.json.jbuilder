json.array!(@policies) do |policy|
  json.extract! policy, :id, :name, :state, :number, :dba, :phone, :email, :wholesale_id, :wholesale_rep_id, :retail_id, :retail_rep_id, :uw_id, :mgu_id, :program_id
  json.url policy_url(policy, format: :json)
end
