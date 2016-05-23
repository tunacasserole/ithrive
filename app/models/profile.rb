class Profile < ActiveRecord::Base
  belongs_to :user

  after_save :notify, if: :notifiable?

  scope :name_sort, -> { order(last_name: :asc, first_name: :asc) }

  def display_name
    "#{last_name}, #{first_name}"
  end

  protected
    def notify
      recipients.each do |r|
        Notification.create(user_id: r.id, thriver_id: self.user.id, kind: 'health_attribute', content: self.health_attribute.notify_text)
      end
    end

    def recipients
      [User.first]
    end

    def notifiable?
      self.answer == true && self.health_attribute.notify
    end
end



  # enum sex: [:female, :male, :other]

  # validates :first_name, :last_name, presence: true
  # validates :cancer_type, :age, :sex, presence: true

  # # required fields if the user has had cancer
  # validates :time_since_diagnosis, presence: true, unless: proc { |m| m.cancer_type == 'I have never been diagnosed with cancer' }
  # validates :received_chemotherapy, :received_radiation_therapy, :active_cancer, :metastatic_cancer, :receiving_cancer_treatment, inclusion: { in: [true, false] , message: 'is required'}, unless: proc { |m| m.cancer_type == 'I have never been diagnosed with cancer' }

  # validates :has_kidney_disease, inclusion: { in: [true, false], message: "is required" }
  # validates :has_liver_disease, inclusion: { in: [true, false], message: "is required" }
  # validates :has_congestive_heart_failure, inclusion: { in: [true, false], message: "is required" }
  # validates :has_atrial_fibrillation, inclusion: { in: [true, false], message: "is required" }
  # validates :has_dementia, inclusion: { in: [true, false], message: "is required" }
  # validates :has_diabetes, inclusion: { in: [true, false], message: "is required" }
  # validates :increased_bowel_obstruction_risk, inclusion: { in: [true, false], message: "is required" }
  # validates :cannot_maintain_balance, inclusion: { in: [true, false], message: "is required" }

  # after_save :update_user_filters



#   FILTERABLE_ATTRIBUTES = %w(
#     received_chemotherapy
#     received_radiation_therapy
#     active_cancer
#     metastatic_cancer
#     receiving_cancer_treatment
#     has_kidney_disease
#     has_liver_disease
#     has_congestive_heart_failure
#     has_atrial_fibrillation
#     has_dementia
#     has_diabetes
#     cannot_maintain_balance
#     increased_bowel_obstruction_risk
#   ).freeze

#   def update_user_filters
#     # FilterUpdater.new(FILTERABLE_ATTRIBUTES, self, user).run
#   end


# end
