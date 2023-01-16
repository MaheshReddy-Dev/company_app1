  class Project < ApplicationRecord
  belongs_to :employee
  has_many :tasks
  validates :employee_id,
             presence: true
  validates :title,
             presence: true,
             uniqueness: {case_sensitive: false},
             length: { minimum: 3, maximum: 25 }
  validates :description,
             presence: true

  end
