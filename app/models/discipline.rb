class Discipline < ApplicationRecord
  belongs_to :frequence

  validates :name, presence: true
  validates :duree, presence: true
  validates :frequence, presence: true

end
