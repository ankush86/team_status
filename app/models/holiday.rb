class Holiday < ApplicationRecord

  # Associations
  belongs_to :user

  # Validations
  validates :start_at, presence: true
  validates :end_at, presence: true

end
