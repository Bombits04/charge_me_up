class ChgSpot < ApplicationRecord

  ## associations
  belongs_to :user
  has_many :comments, dependent: :destroy

  ## validations
  validates :name, presence: true
  validates :address, presence: true

  after_initialize :set_default_score, if: :new_record?

  # Define ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["name", "region", "province", "address", "city", "is_approved"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "comments"]
  end

  def upvote
    increment!(:score)
  end

  def downvote
    decrement!(:score)
  end

  private

  def set_default_score
    self.score ||= 0
  end
end
