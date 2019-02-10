# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::CompaniesController, type: :controller do
  describe 'GET #index' do
    subject(:get_index) { get :index }

    it { expect(get_index.content_type).to eq 'application/json' }
    it { expect(get_index).to be_ok }

    context 'when checking json object content' do
      let(:parsed_response_body) { JSON.parse(get_index.body) }
      let(:data) { parsed_response_body['data'] }

      context 'without companies' do
        it { expect(data).to be_empty }
      end

      context 'with companies' do
        before { create_list :company, 3 }

        it { expect(data.size).to eq 3 }
      end
    end
  end

  describe 'GET #show' do
    subject(:get_show) { get :show, params: { id: id } }

    let(:company) { create :company }
    let(:id) { company.id }

    it { expect(get_show.content_type).to eq 'application/json' }
    it { expect(get_show).to be_ok }

    context 'when checking json object content' do
      let(:parsed_response_body) { JSON.parse(get_show.body) }
      let(:data) { parsed_response_body['data'] }

      context 'when company do not exist' do
        let(:id) { company.id + 1 }

        it { expect(get_show).to be_not_found }
      end

      context 'when company exists' do
        before { company }

        it { expect(data['id']).to eq company.id.to_s }
        it { expect(data['attributes']['name']).to eq company.name }
      end
    end
  end
end
