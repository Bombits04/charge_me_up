class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ## associations
  has_many :chg_spots
  has_many :comments

  ## validations
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :is_admin, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6, maximum: 128 }, format: { with: /\d/, message: "must contain a number" }, format: { with: /[a-zA-Z]/, message: "must contain a letter" }, format: { with: /\W/, message: "must contain a special character" }
  validates :is_admin, presence: true
end
