class ChgSpot < ApplicationRecord

  ## associations
  belongs_to :user
  has_many :comments

  ## validations
  validates :name, presence: true
  validates :address, presence: true

  # Define ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["name", "region", "province", "address", "barangay", "city"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["user", "comments"]
  end
end
