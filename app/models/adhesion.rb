class Adhesion < ApplicationRecord
  belongs_to :user
  belongs_to :year

  has_many :crenaus
end
