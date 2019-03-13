class User < ApplicationRecord

  # Associations
  has_many :holidays
  has_many :assigned_projects
  has_many :projects, through: :assigned_projects

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :contact, presence: true
  validates :skills, presence: true
  validates :email, presence: true

  # scopes
  scope :skills_in, -> (skills) { where('skills like any (ARRAY[?])', skills) }
  scope :by_name, -> (first_name, last_name) { where('first_name = ? OR last_name = ?', first_name, last_name) }
  scope :on_project, -> (project) { joins(:projects).where('project_id = ?', project) }

  scope :on_holidays, -> { joins(:holidays).where('holidays.start_at <= ? AND holidays.end_at >= ?', Time.now, Time.now)}

  scope :on_working, -> { joins(:projects).where('projects.start_at <= ? AND projects.end_at >= ?', Time.now, Time.now) }

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
    binding.pry
    self[:skills] = skills.gsub("[", "").gsub("]", "")
  end
end
