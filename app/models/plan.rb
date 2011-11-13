class Plan < ActiveRecord::Base
  validates :name,        :presence => true, :uniqueness => true
  validates :cost,        :presence => true
  validates :trial_days,  :presence => true
end
