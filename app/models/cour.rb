class Cour < ApplicationRecord
  belongs_to :student
  belongs_to :discipline
  belongs_to :instrument
  belongs_to :user
  belongs_to :year
end
