# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::SecondLevelManageesController, type: :controller do
  let(:company) { create :company }
  let(:manager) { create :employee, company: company }

  describe 'GET #index' do
    subject(:get_index) do
      get :index, params: { employee_id: manager.id }
    end

    before do
      create_list :employee, 3, manager: employee_manager, company: company
    end

    let(:employee_manager) { manager }

    it { expect(get_index.content_type).to eq 'application/json' }
    it { expect(get_index).to be_ok }

    context 'when checking json object content' do
      let(:parsed_response_body) { JSON.parse(get_index.body) }
      let(:data) { parsed_response_body['data'] }

      context 'without employees from manager' do
        let(:employee_manager) { create :employee, company: company }

        it { expect(data).to be_empty }
      end

      context 'with employees from the same company' do
        it { expect(data.size).to eq 3 }
      end
    end
  end
end
