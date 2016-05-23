class User < ActiveRecord::Base
  has_many :profiles, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id, dependent: :destroy
  # has_many :user_action_steps, dependent: :destroy
  # has_many :action_steps, through: :user_action_steps
  has_many :filters_users, dependent: :destroy
  has_many :filters, through: :filters_users
  # has_many :responses, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  # validates :password, presence: true,
  #                      confirmation: true,
  #                      length: { within: 8..40 },
  #                      on: :create
  # validates :password, confirmation: true,
  #                      length: { within: 8..40 },
  #                      allow_blank: true,
  #                      on: :update

  # validates :email, uniqueness: true

  validates_acceptance_of :terms_of_service_agreement,
    accept: true,
    message: 'must be accepted',
    on: :create

  before_create :build_profile

  scope :name_sort, -> { order(last_name: :asc, first_name: :asc) }

  def name
    self.profile.display_name
  end

  def profile_completed?
    !profile.nil?
  end

  # def onboarding_completed?
  #   profile_completed? && health_attributes_completed? && first_survey_submitted?
  # end

  # def health_attributes_completed?
  #   health_attributes.any?
  # end

  # def first_survey_submitted?
  #   responses.any?
  # end

  # def latest_response
  #   responses.last
  # end

  # def current_top_recommendations
  #   return [] unless latest_response.present?

  #   top_recs = latest_response.top_recommendations.map(&:action_step)
  #   top_recs - active_action_steps
  # end

  # def current_additional_recommendations
  #   return [] unless latest_response.present?

  #   current_recs = latest_response.additional_recommendations.map(&:action_step)
  #   current_recs - active_action_steps
  # end

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

  def self.current
    User.find_by_email 'aaron@buildit.io'
  end

  def mark_all_as_read
    self.notifications.each {|n| n.mark_as_read }
  end

  def display_name
    "#{last_name}, #{first_name}"
  end


  private
    def build_profile


      true
    end

end
