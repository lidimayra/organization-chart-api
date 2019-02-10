# frozen_string_literal: true

module V1
  class BaseController < ApplicationController
    private

    def set_employee
      @employee = Employee.find(params[:employee_id])
    end
  end
end
