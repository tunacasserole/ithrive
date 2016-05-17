class Agency < ActiveRecord::Base
  has_many :users
  has_many :quotes, through: :users
  validates_presence_of :name
  validates_inclusion_of :type_of, {:in => ['retail', 'wholesale', 'mgu', '']}
end
