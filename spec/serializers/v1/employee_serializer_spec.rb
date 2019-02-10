# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::EmployeeSerializer, type: :serializer do
  let(:employee) { build_stubbed(:employee) }
  let(:json_object) { described_class.new(employee).as_json }

  it { expect(json_object[:name]).to eq employee.name }
  it { expect(json_object[:email]).to eq employee.email }
end
