# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    name { 'John Doe' }
    sequence(:email) { |n| "john#{n}@example.com" }
    company
  end
end
