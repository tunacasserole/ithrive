class CreateHealthAttributes < ActiveRecord::Migration
  create_table :health_attributes do |t|
    t.references :user, index: true, foreign_key: true
    t.boolean :experiences_joint_pain
    t.boolean :feel_distressed
    t.boolean :disruptive_fatigue
    t.boolean :pain_limits_daily_activities
    t.boolean :troubled_by_constipation
    t.boolean :experiences_hot_flashes_or_night_sweats_daily
    t.boolean :has_trouble_sleeping
    t.boolean :experiences_loss_of_interest_in_daily_activities
    t.boolean :wants_to_harm_self_or_others
    t.boolean :feels_anxiety_frequently
    t.boolean :memory_problems_interfere_with_daily_life
    t.boolean :has_unexplained_weight_loss
    t.boolean :has_been_recommended_low_fiber_diet
    t.boolean :has_had_gall_bladder_removed
    t.boolean :has_difficulty_swallowing
    t.boolean :has_lymphedema
    t.boolean :experiences_increased_size_of_legs_or_abdomen
    t.boolean :has_lower_than_desired_sexual_desire
    t.boolean :intercourse_is_painful
    t.boolean :has_insufficient_social_support
    t.boolean :experiences_diarrhea

    t.timestamps null: false
  end
end
