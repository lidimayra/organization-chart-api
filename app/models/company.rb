# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :employees, inverse_of: :company

  validates :name, presence: true
end
