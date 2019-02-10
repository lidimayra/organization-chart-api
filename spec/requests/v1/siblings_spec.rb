# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Siblings endpoints', type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:company) { create :company }
  let(:manager) { create :employee, company: company }

  context 'when listing employees' do
    before do
      create_list :employee, 2, company: company, manager: manager
      get "/v1/employees/#{manager.id}/siblings"
    end

    it { expect(response).to be_success }
    it { expect(json['data'].length).to eq 2 }
    it { expect(json['data'][0].keys).to match_array %w[id type attributes] }
  end
end
