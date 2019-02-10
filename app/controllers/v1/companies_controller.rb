# frozen_string_literal: true

module V1
  class CompaniesController < V1::BaseController
    def index
      companies = Company.all
      render json: companies, status: :ok
    end
  end
end
