# frozen_string_literal: true

module V1
  class SecondLevelManageesController < V1::BaseController
    before_action :set_employee

    def index
      employees = @employee.managees
      render json: employees, status: :ok
    end
  end
end
