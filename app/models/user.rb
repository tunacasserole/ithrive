class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :health_attributes, dependent: :destroy
  # has_many :user_action_steps, dependent: :destroy
  # has_many :action_steps, through: :user_action_steps
  # has_many :filters_users, dependent: :destroy
  # has_many :filters, through: :filters_users
  # has_many :responses, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :password, presence: true,
                       confirmation: true,
                       length: { within: 8..40 },
                       on: :create
  validates :password, confirmation: true,
                       length: { within: 8..40 },
                       allow_blank: true,
                       on: :update

  validates :email, uniqueness: true

  validates_acceptance_of :terms_of_service_agreement,
    accept: true,
    message: 'must be accepted',
    on: :create

  before_create :create_profile
  after_create :create_health_attribute


  def create_health_attribute
    ha = self.health_attributes.create
    ha.save(validate: false)
  end

  def profile_completed?
    !profile.nil?
  end

  def onboarding_completed?
    profile_completed? && health_attributes_completed? && first_survey_submitted?
  end

  def health_attributes_completed?
    health_attributes.any?
  end

  def first_survey_submitted?
    responses.any?
  end

  def latest_response
    responses.last
  end

  def current_top_recommendations
    return [] unless latest_response.present?

    top_recs = latest_response.top_recommendations.map(&:action_step)
    top_recs - active_action_steps
  end

  def current_additional_recommendations
    return [] unless latest_response.present?

    current_recs = latest_response.additional_recommendations.map(&:action_step)
    current_recs - active_action_steps
  end

  def active_user_action_steps
    user_action_steps.active
  end

  def active_action_steps
    active_user_action_steps.map(&:action_step)
  end

  def completed_action_steps
    self.user_action_steps.completed.map(&:action_step)
  end

  def update_filters(filter_sets)
    # add any filters that should be "on" unless they already exist for the user
    filter_sets[:on].each { |f| filters << f unless filters.include? f }

    # remove any filters that should be off, if they were "on" before
    filter_sets[:off].each { |f| filters.destroy(f) if filters.include? f }
  end

  def admin?
    return ['aaron@buildit.io','jason@buildit.io'].include? self.email
  end

  private
    def build_default_profile
    # build default profile instance. Will use default params.
    # The foreign key to the owning User model is set automatically
    build_profile
    true # Always return true in callbacks as the normal 'continue' state
         # Assumes that the default_profile can **always** be created.
         # or
         # Check the validation of the profile. If it is not valid, then
         # return false from the callback. Best to use a before_validation
         # if doing this. View code should check the errors of the child.
         # Or add the child's errors to the User model's error array of the :base
         # error item
    end

end
