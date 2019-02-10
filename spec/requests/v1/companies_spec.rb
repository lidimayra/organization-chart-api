# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Companies endpoints', type: :request do
  let(:json) { JSON.parse(response.body) }

  context 'when listing companies' do
    before do
      create_list :company, 2
      get '/v1/companies'
    end

    it { expect(response).to be_success }
    it { expect(json['data'].length).to eq 2 }
    it { expect(json['data'][0].keys).to match_array %w[id type attributes] }
  end

  context 'when displaying a company' do
    let(:company) { create :company }

    before { get "/v1/companies/#{company.id}" }

    it { expect(response).to be_success }
    it { expect(json['data'].keys).to match_array %w[id type attributes] }
  end

  context 'when creating a company' do
    before do
      post '/v1/companies', params: { company: { name: 'Hooli' } }
    end

    it { expect(response).to be_created }
    it { expect(json['data'].keys).to match_array %w[id type attributes] }
    it { expect(json['data']['attributes']['name']).to eq 'Hooli' }
  end
end
