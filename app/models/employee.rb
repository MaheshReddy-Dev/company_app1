  class Employee < ApplicationRecord
  before_save { self.email = email.downcase}
  belongs_to :company
  has_many :projects
  validates :company_id,
             presence: true
  validates :gender,
             presence:true
  validates :name,
               presence: true,
               uniqueness: {case_sensitive: false},
               length: { minimum: 3, maximum: 25 }
               VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
     validates :email,
                presence: true,
                uniqueness: { case_sensitive: false },
                length: { maximum: 105 },
                format: { with: VALID_EMAIL}
    validates :phonenumber,
               presence: true,
               uniqueness: { case_sensitive: false },
               length: { maximum: 10 }

    #enum gender: [:female, :male, :others]
    validates :salary,
               numericality: { greater_than: 0 }
    validates :experience,
               numericality: { only_integer: true, greater_than_or_equal_to: 0 }




end
