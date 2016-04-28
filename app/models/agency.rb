class Agency < ActiveRecord::Base
  validates_inclusion_of :type_of, :in => ['retail', 'wholesale', 'mgu']
  validates_presence_of :name
end
