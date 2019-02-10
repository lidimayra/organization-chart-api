# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :company, inverse_of: :employees
  belongs_to :manager, class_name: 'Employee', optional: true

  has_many :managees, class_name: 'Employee', foreign_key: 'manager_id'

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :company, presence: true

  validate :manager_belongs_to_company

  def manager_belongs_to_company
    message = 'must belong to the same company'
    errors.add(:manager, message) if manager && manager.company != company
  end

  def second_level_managees
    manager_ids = Employee.where(manager_id: id).pluck(:id)
    Employee.where(manager_id: manager_ids)
  end
end
