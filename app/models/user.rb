class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ## associations
  has_many :chg_spots
  has_many :comments

  ## validations
  validates :username, presence: true, uniqueness: true
  validates :is_admin, presence: true
end
