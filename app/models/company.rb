class Company < ApplicationRecord
  has_many :employees , dependent: :destroy
  validates :name, presence: true
  validates :website, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
