class User < ApplicationRecord
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :tel1, presence: true

  belongs_to :function
  has_many :students, dependent: :destroy
  has_many :cours
  has_many :adhesions
  has_many :years, through: :adhesions
  has_many :crenaus
  def fullname
    self.first_name.capitalize + " " + self.last_name.capitalize
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now

  end

end
