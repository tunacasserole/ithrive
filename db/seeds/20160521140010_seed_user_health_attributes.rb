class SeedUserHealthAttributes < ActiveRecord::Migration
  HealthAttribute.all.each_with_index do |q,i|
    UserHealthAttribute.create(user_id: 1, health_attribute_id: q.id, answer: true)
  end
end
