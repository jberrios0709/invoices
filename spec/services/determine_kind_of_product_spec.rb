require 'spec_helper'
require_relative '../../app/autoload'

RSpec.describe 'Services::DetermineKindOfProduct' do
  subject(:service) { Services::DetermineKindOfProduct.call(line)}

  context 'when is a normal product' do
    let(:line) { '1 music CD at 14.99' }

    it 'works' do
      expect(service).to be_kind_of(Product)
    end

    it 'has correctly imported' do
      expect(service.imported).to be_falsey
    end
  end

  context 'when is book' do
    let(:line) { '2 book at 12.49' }

    it 'works' do
      expect(service).to be_kind_of(Book)
    end
  end

  context 'when is medicine' do
    let(:line) { '1 packet of headache pills at 9.75' }

    it 'works' do
      expect(service).to be_kind_of(Medicine)
    end
  end

  context 'when is a normal product imported' do
    let(:line) { '1 imported bottle of perfume at 47.50' }

    it 'works' do
      expect(service).to be_kind_of(Product)
    end

    it 'has correctly imported' do
      expect(service.imported).to be_truthy
    end
  end
end