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

  describe '#second_level_managees' do
    subject(:second_level_managees) do
      top_level_manager.second_level_managees
    end

    let(:company) { build :company }
    let(:top_level_manager) { create :employee, company: company }

    let(:middle_managers) do
      create_list :employee, 2, company: company, manager: top_level_manager
    end

    let!(:managees_1) do
      create_list :employee, 2, company: company, manager: middle_managers[0]
    end

    let!(:managees_2) do
      create_list :employee, 3, company: company, manager: middle_managers[1]
    end

    it { expect(second_level_managees.count).to eq 5 }

    it 'returns expected list' do
      expected_list = managees_1 + managees_2
      expect(second_level_managees.to_a).to match_array expected_list
    end
  end
end
