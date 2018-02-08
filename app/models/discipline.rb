class Discipline < ApplicationRecord
  belongs_to :frequence
  belongs_to :tarif
  validates :name, presence: true
  validates :duree, presence: true
  validates :frequence, presence: true

end
