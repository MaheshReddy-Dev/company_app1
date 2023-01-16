class Company < ApplicationRecord
  has_many :employees
  validates :name,
             presence: true,
             uniqueness: {case_sensitive: false},
             length: { minimum: 3, maximum: 25 }
  validates :state,
             presence: true,
             length: { minimum: 3, maximum: 25 }
  validates :city,
             presence: true,
             length: { minimum: 3, maximum: 25 }
  validates :website,
             presence: true,
             uniqueness: {case_sensitive: false},
             length: { minimum: 3, maximum: 25 }


end
