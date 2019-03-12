class Project < ApplicationRecord
  TECH = %w{js python ror}

  has_many :assigned_projects
  has_many :users, through: :assigned_projects

  # Validates
  validates :name, presence: true
  validates :technology, presence: true

end
