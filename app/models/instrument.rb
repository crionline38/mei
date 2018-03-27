class Instrument < ApplicationRecord
  has_many :cours
  belongs_to :instrud
  has_many :disciplines, through: :instrud
  has_many :crenaus

end
