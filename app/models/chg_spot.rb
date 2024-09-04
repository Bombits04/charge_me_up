class ChgSpot < ApplicationRecord

  ## associations
  belongs_to :user
  has_many :comments

  ## validations
  validates :name, presence: true
  validates :address, presence: true

  ## ransack search
  def self.ransackable_attributes(_auth_object = nil)
    [
      "region",
      "province",
      "city",
      "barangay",
      "address",
    ]
  end
end
