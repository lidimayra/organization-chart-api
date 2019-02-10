# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::EmployeesController, type: :controller do
  let(:company) { create :company }

  describe 'GET #index' do
    subject(:get_index) do
      get :index, params: { company_id: company.id }
    end

    before { create_list :employee, 3, company: employees_company }

    let(:employees_company) { company }

    it { expect(get_index.content_type).to eq 'application/json' }
    it { expect(get_index).to be_ok }

    context 'when checking json object content' do
      let(:parsed_response_body) { JSON.parse(get_index.body) }
      let(:data) { parsed_response_body['data'] }

      context 'without employees from the same company' do
        let(:employees_company) { create :company }

        it { expect(data).to be_empty }
      end

      context 'with employees from the same company' do
        it { expect(data.size).to eq 3 }
      end
    end
  end

  describe 'POST #create' do
    subject(:post_create) { post :create, params: params }

    let(:attributes) { attributes_for :employee }
    let(:params) do
      { company_id: company.id, employee: attributes }
    end

    context 'when valid' do
      it { expect { post_create }.to change(Employee, :count).by 1 }

      it 'has a created status code' do
        post_create
        expect(response).to be_created
      end
    end

    context 'when invalid' do
      let(:attributes) { attributes_for(:employee).except(:email) }

      it { expect { post_create }.not_to change(Employee, :count) }

      it 'has unprocessable entity status code' do
        post_create
        expect(response).to be_unprocessable
      end

      it 'returns error message' do
        post_create
        json = JSON.parse(response.body)
        expect(json['errors']).to eq('email' => ["can't be blank"])
      end
    end
  end

  describe 'DELETE #destroy' do
    subject(:delete_destroy) do
      delete :destroy,
             params: { company_id: company.id, id: employee.id }
    end

    let!(:employee) { create :employee, company: company }

    it 'destroy employee record' do
      expect { delete_destroy }.to change(Employee, :count).from(1).to(0)
    end

    it 'returns no content' do
      delete_destroy
      expect(response).to be_no_content
    end
  end
end
