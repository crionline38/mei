class Year < ApplicationRecord
  has_many :adhesion
  has_many :crenaus

  validates_format_of :name, :with => /2[0-9]*\/2[0-9]*/i, :on => :create

end
