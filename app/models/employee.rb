# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :company, inverse_of: :employees

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :company, presence: true
end
