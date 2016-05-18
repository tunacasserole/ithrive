class Survey < ActiveRecord::Base
  # has_many :responses

  def self.current
    last
  end
end
