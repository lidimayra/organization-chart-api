# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject(:employee) { build(:employee) }

  it { is_expected.to belong_to(:company).inverse_of(:employees) }
  it { is_expected.to belong_to(:manager).class_name('Employee').optional }

  it 'has many managees' do
    is_expected.to have_many(:managees)
      .class_name('Employee')
      .with_foreign_key('manager_id')
  end

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of :email }
  it { is_expected.to validate_presence_of :company }

  context 'when associating a manager' do
    let(:manager) { create :employee, company: company }

    before { employee.manager = manager }

    context 'when manager belongs to the same company' do
      let(:company) { employee.company }

      it { expect(employee).to be_valid }
    end

    context 'when manager does not belong to the same company' do
      let(:company) { create :company }

      it { expect(employee).not_to be_valid }
    end
  end
end
