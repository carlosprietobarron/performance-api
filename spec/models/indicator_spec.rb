# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Indicator, type: :model do
  describe 'Indicator validations' do
    let(:indicator) { build(:indicator) }

    it 'test create new indicator' do
      indicator.name = 'indicator test'
      expect(indicator.name).to eq('indicator test')
      expect(indicator).to be_valid
    end

    it 'validates name must be present' do
      expect(indicator).to be_valid
    end

    it 'validates null name are not valid' do
      indicator.name = ''
      expect(indicator).not_to be_valid
    end
  end
end
