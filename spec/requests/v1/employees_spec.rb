# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Employees endpoints', type: :request do
  let(:company) { create :company }
  let(:json) { JSON.parse(response.body) }

  context 'when listing employees' do
    before do
      create_list :employee, 2, company: company
      get "/v1/companies/#{company.id}/employees"
    end

    it { expect(response).to be_success }
    it { expect(json['data'].length).to eq 2 }
    it { expect(json['data'][0].keys).to match_array %w[id type attributes] }
  end
end
