class Cour < ApplicationRecord
  belongs_to :student
  belongs_to :discipline
  belongs_to :instrument
  belongs_to :user
  belongs_to :year

  validates :student, presence: true
  validates :discipline, presence: true
  validates :user, presence: true
  validates :year, presence: true
end
