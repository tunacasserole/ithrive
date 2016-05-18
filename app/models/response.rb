class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey

  # has_many :recommendations, dependent: :destroy

  validates :response_record, presence: true

  def process!
    SurveyAnalyzer.new(self).run
    # Queue up the recommendation engine to run:
    RecommendationGeneratorJob.perform_now(id)
  end

  def top_recommendations
    recommendations.top
  end

  def additional_recommendations
    recommendations.additional
  end
end
