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

    def create
      company = Company.new(company_params)

      if company.save
        render json: company, status: :created
      else
        render json: { errors: company.errors }, status: :unprocessable_entity
      end
    end

    private

    def company_params
      params.require(:company).permit(:name)
    end
  end
end
