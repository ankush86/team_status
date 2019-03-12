class AssignedProject < ApplicationRecord

  # Associations
  belongs_to :user
  belongs_to :project

  # Validations
  validates :end_at, presence: true

end
