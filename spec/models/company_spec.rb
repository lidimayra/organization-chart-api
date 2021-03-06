# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { build(:company) }

  it { is_expected.to have_many(:employees).inverse_of(:company) }

  it { is_expected.to validate_presence_of :name }
end
