class Student < ApplicationRecord
  belongs_to :user
  has_many :cours

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :year, presence: true

  def fullname
    self.first_name.capitalize + " " + self.last_name.capitalize
  end
end
