class SeedUserProfiles < ActiveRecord::Migration
  User.all.each do |u|
    Question.all.each_with_index do |q,i|
      # for console testing
      # u=User.first
      # q=Question.first
      # p=Profile.create( user_id: u, question_id: q.id, answer: (i.even? ? true : false) )
      Profile.create( user_id: u.id, question_id: q.id, sequence: i, answer: (i.even? ? true : false) )
    end
  end
end
