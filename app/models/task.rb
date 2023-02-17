class Task < ApplicationRecord
    belongs_to :project
    validates :project_id,
               presence: true
    validates :name,
               presence: true,
               uniqueness: {case_sensitive: false},
               length: { minimum: 3, maximum: 25 }
    validates :description,
               presence: true,
               uniqueness: {case_sensitive: false},
               length: { minimum: 6, maximum: 100 }
end
  