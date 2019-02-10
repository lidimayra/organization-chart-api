# frozen_string_literal: true

module V1
  class EmployeeSerializer < ActiveModel::Serializer
    attributes :name, :email
  end
end
