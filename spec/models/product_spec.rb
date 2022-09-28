require 'spec_helper'
require_relative '../../app/autoload'

RSpec.describe 'Product' do
  subject(:object) { Product.new }

  context 'when is imported' do
    before do
      object.imported = true
      object.title = 'imported bottle of perfume'
      object.quantity = 1
      object.price = 47.5
    end

    it 'calculate correctly total' do
      expect(object.calculate_total).to eq 54.65
    end

    it 'calculate correctly taxes' do
      expect(object.calculate_taxes).to eq 7.15
    end
  end

  context 'when is not imported' do
    before do
      object.imported = false
      object.title = 'music CD'
      object.quantity = 1
      object.price = 14.99
    end

    it 'calculate correctly total' do
      expect(object.calculate_total).to eq 16.49
    end

    it 'calculate correctly taxes' do
      expect(object.calculate_taxes).to eq 1.5
    end
  end
end