# frozen_string_literal: true

module V1
  class CompaniesController < V1::BaseController
    def index
      companies = Company.all
      render json: companies, status: :ok
    end

    def show
      company = Company.find(params[:id])
      render json: company
    end
  end
end
