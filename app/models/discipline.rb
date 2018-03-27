class Discipline < ApplicationRecord
  belongs_to :frequence
  belongs_to :tarif
  has_many :cours
  has_many :instruds
  has_many :instruments, through: :instruds
  has_many :crenaus

  validates :name, presence: true
  validates :duree, presence: true
  validates :frequence, presence: true

end
