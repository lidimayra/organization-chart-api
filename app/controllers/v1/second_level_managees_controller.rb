# frozen_string_literal: true

module V1
  class SecondLevelManageesController < V1::BaseController
    before_action :set_employer

    def index
      employees = @employee.managees
      render json: employees, status: :ok
    end

    private

    def set_employer
      @employee = Employee.find(params[:employee_id])
    end
  end
end
