# frozen_string_literal: true

module V1
  class ManageesController < V1::BaseController
    before_action :set_employee

    def index
      employees = @employee.managees
      render json: employees, status: :ok
    end

    def set_employee
      @employee = Employee.find(params[:employee_id])
    end
  end
end
