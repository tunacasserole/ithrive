class User < ActiveRecord::Base

# VALIDATIONS (Start) ===================================================================
  validates  :email,                                  :presence  => true
  validates  :name,                                   :presence  => true
# VALIDATIONS (End)

# DEFAULTS (Start) ======================================================================

# DEFAULTS (End)

# ASSOCIATIONS (Start) ==================================================================
  belongs_to :agency
# ASSOCIATIONS (End)


  enum role: [:consumer, :retailer, :wholesaler, :underwriter, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :consumer
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
