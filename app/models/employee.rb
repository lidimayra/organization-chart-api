# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :company, inverse_of: :employees
  belongs_to :manager, class_name: 'Employee', optional: true

  has_many :managees, class_name: 'Employee', foreign_key: 'manager_id'

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :company, presence: true
end
