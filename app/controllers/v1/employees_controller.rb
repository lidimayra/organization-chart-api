# frozen_string_literal: true

module V1
  class EmployeesController < V1::BaseController
    def index
      company = Company.find(params[:company_id])
      employees = company.employees
      render json: employees, status: :ok
    end
  end
end
