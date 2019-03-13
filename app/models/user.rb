class User < ApplicationRecord

  # Associations
  has_many :assigned_projects
  has_many :projects, through: :assigned_projects

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :contact, presence: true
  validates :skills, presence: true
  validates :email, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def current_project
    projects.where("end_at >= ?", Time.now)&.map(&:name)
  end

  def end_date
    assigned_projects.where("end_at >= ?", Time.now)&.map(&:end_at)
  end

  def skills=(skills)
    self[:skills] = skills.split(',')
  end
end
