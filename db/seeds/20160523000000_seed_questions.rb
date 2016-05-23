class SeedQuestions < ActiveRecord::Migration
  BOOLEAN_HEALTH_ATTRIBUTE_QUESTIONS = [
    :experiences_joint_pain,
    :feel_distressed,
    :disruptive_fatigue,
    :pain_limits_daily_activities,
    :troubled_by_constipation,
    :experiences_hot_flashes_or_night_sweats_daily,
    :has_trouble_sleeping,
    :experiences_loss_of_interest_in_daily_activities,
    :wants_to_harm_self_or_others,
    :feels_anxiety_frequently,
    :memory_problems_interfere_with_daily_life,
    :has_unexplained_weight_loss,
    :has_been_recommended_low_fiber_diet,
    :has_had_gall_bladder_removed,
    :has_difficulty_swallowing,
    :has_lymphedema,
    :experiences_increased_size_of_legs_or_abdomen,
    :has_lower_than_desired_sexual_desire,
    :intercourse_is_painful,
    :has_insufficient_social_support,
    :experiences_diarrhea]

    BOOLEAN_HEALTH_ATTRIBUTE_QUESTIONS.each_with_index do |q,i|
      Question.create(name: q, sequence: i*10, type_of: 'health-attribute')
    end
end
