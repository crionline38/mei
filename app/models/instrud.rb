class Instrud < ApplicationRecord
  belongs_to :instrument
  belongs_to :discipline
  validates :instrument, uniqueness: { scope: :discipline,
    message: "Deja associés" }
end
