class Comment < ApplicationRecord
  ## associations
  belongs_to :chg_spot
  belongs_to :user

  ## validations
  # validates :comment, presence: true
  # validates :chg_spot_id, presence: true
  # validates :user_id, presence: true
end
