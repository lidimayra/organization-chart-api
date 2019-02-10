# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::CompanySerializer, type: :serializer do
  let(:company) { build_stubbed(:company) }
  let(:json_object) { described_class.new(company).as_json }

  it { expect(json_object[:name]).to eq company.name }
end
