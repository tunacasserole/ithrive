class UserProfile < ActiveRecord::Base

# VALIDATIONS (Start) ===================================================================
  validates    :user_id,                                  :presence    => true
# VALIDATIONS (End)

# DEFAULTS (Start) ======================================================================

# DEFAULTS (End)

# ASSOCIATIONS (Start) ==================================================================
  belongs_to   :user
# ASSOCIATIONS (End)

end
