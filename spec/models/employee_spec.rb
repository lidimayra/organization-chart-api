# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject { build(:employee) }

  it { is_expected.to belong_to(:company).inverse_of(:employees) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of :email }
  it { is_expected.to validate_presence_of :company }
end
