class SeedUserHealthAttributes < ActiveRecord::Migration
  Question.all.each_with_index do |q,i|
    Profile.create(user_id: 1, question_id: q.id, answer: true)
  end
end
