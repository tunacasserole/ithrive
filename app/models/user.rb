class User < ActiveRecord::Base

# VALIDATIONS (Start) ===================================================================
  validates  :email,                                    :presence  => true
  validates  :name,                                   :presence  => true
# VALIDATIONS (End)

# DEFAULTS (Start) ======================================================================

# DEFAULTS (End)

# ASSOCIATIONS (Start) ==================================================================
  has_one   :user_profile
# ASSOCIATIONS (End)


  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  after_create :create_profile

  def create_profile
    build_user_profile
  end

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
