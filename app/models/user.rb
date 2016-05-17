class User < ActiveRecord::Base

# VALIDATIONS (Start) ===================================================================
  validates  :name,                                   :presence  => true
  validates  :email,                                  :presence  => true
  validates_inclusion_of :role, :in => ['consumer', 'wholesale', 'retailer', 'underwriter', 'admin']
# VALIDATIONS (End)

# DEFAULTS (Start) ======================================================================

# DEFAULTS (End)

# ASSOCIATIONS (Start) ==================================================================
  belongs_to :agency
  has_many :quotes
# ASSOCIATIONS (End)

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :consumer
  end

  def admin?
    return ['aaron@buildit.io','derek@raterspot.com'].include? self.email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable



end
