class Project < ApplicationRecord
  TECH = %w{js python ror}

  # Validates
  validates :name, presence: true
  validates :technology, presence: true

end
