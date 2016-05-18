class HealthAttribute < ActiveRecord::Base
  belongs_to :user

  validates :feel_distressed, inclusion: { in: [true, false], message: "is required" }
  validates :experiences_loss_of_interest_in_daily_activities, inclusion: { in: [true, false], message: "is required" }
  validates :has_insufficient_social_support, inclusion: { in: [true, false], message: "is required" }
  validates :feels_anxiety_frequently, inclusion: { in: [true, false], message: "is required" }
  validates :disruptive_fatigue, inclusion: { in: [true, false], message: "is required" }
  validates :pain_limits_daily_activities, inclusion: { in: [true, false], message: "is required" }
  validates :troubled_by_constipation, inclusion: { in: [true, false], message: "is required" }
  validates :experiences_diarrhea, inclusion: { in: [true, false], message: "is required" }
  validates :experiences_hot_flashes_or_night_sweats_daily, inclusion: { in: [true, false], message: "is required" }
  validates :has_trouble_sleeping, inclusion: { in: [true, false], message: "is required" }
  validates :memory_problems_interfere_with_daily_life, inclusion: { in: [true, false], message: "is required" }
  validates :has_lower_than_desired_sexual_desire, inclusion: { in: [true, false], message: "is required" }
  validates :wants_to_harm_self_or_others, inclusion: { in: [true, false], message: "is required" }
  validates :experiences_joint_pain, inclusion: { in: [true, false], message: "is required" }
  validates :has_been_recommended_low_fiber_diet, inclusion: { in: [true, false], message: "is required" }
  validates :has_had_gall_bladder_removed, inclusion: { in: [true, false], message: "is required" }
  validates :has_difficulty_swallowing, inclusion: { in: [true, false], message: "is required" }
  validates :has_lymphedema, inclusion: { in: [true, false], message: "is required" }
  validates :experiences_increased_size_of_legs_or_abdomen, inclusion: { in: [true, false], message: "is required" }
  validates :intercourse_is_painful, inclusion: { in: [true, false], message: "is required" }
  validates :has_unexplained_weight_loss, inclusion: { in: [true, false], message: "is required" }

  after_create :update_user_filters

  FILTERABLE_ATTRIBUTES = %w(
    experiences_joint_pain
    feel_distressed
    disruptive_fatigue
    pain_limits_daily_activities
    troubled_by_constipation
    experiences_hot_flashes_or_night_sweats_daily
    has_trouble_sleeping
    experiences_loss_of_interest_in_daily_activities
    wants_to_harm_self_or_others
    feels_anxiety_frequently
    memory_problems_interfere_with_daily_life
    has_been_recommended_low_fiber_diet
    has_had_gall_bladder_removed
    has_difficulty_swallowing
    has_lymphedema
    experiences_increased_size_of_legs_or_abdomen
    has_lower_than_desired_sexual_desire
    intercourse_is_painful
    has_insufficient_social_support
    experiences_diarrhea
    has_unexplained_weight_loss
  ).freeze

  def update_user_filters
    # FilterUpdater.new(FILTERABLE_ATTRIBUTES, self, user).run
  end
end
