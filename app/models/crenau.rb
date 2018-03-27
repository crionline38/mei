class Crenau < ApplicationRecord
  belongs_to :user
  belongs_to :year
  belongs_to :discipline
  belongs_to :instrument

  validates :instrument, presence: true
  validates :discipline, presence: true
  validates :user, presence: true
  validates :year, presence: true

  validates :jour, presence: true
  validates :recurence, presence: true
  validates :start, presence: true
  validates :end, presence: true




end
