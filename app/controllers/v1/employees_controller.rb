# frozen_string_literal: true

module V1
  class EmployeesController < V1::BaseController
    before_action :set_company

    def index
      employees = @company.employees
      render json: employees, status: :ok
    end

    def create
      employee = @company.employees.new(employee_params)

      if employee.save
        render json: employee, status: :created
      else
        render json: { errors: employee.errors }, status: :unprocessable_entity
      end
    end

    private

    def employee_params
      params.require(:employee).permit(:name, :email)
    end

    def set_company
      @company = Company.find(params[:company_id])
    end
  end
end
