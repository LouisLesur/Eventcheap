class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attendences
  has_many :events, through: :attendances
  has_many :events

  # validates :first_name,
  #   presence: true,
  #   uniqueness: true,
  #   length: { minimum: 2 }
  #
  # validates :last_name,
  #   presence: true,
  #   uniqueness: true,
  #   length: { minimum: 2 }

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
end
