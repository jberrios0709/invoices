require 'spec_helper'
require_relative '../../app/autoload'

RSpec.describe 'Services::Print' do
  subject(:print ) { Services::Print.new }
  context 'when case 1 work ok' do
    let(:invoice) { Invoice.new }
    let(:file) { File.open('spec/inputs/case_1.txt') }
    let(:expected) do
      <<-STRING
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
      STRING
    end

    before do
      file.readlines.each do |line|
        invoice.add_product(line)
      end
    end

    it 'print ok' do
      print.invoice = invoice
      expect(print.print).to eq expected
    end
  end

  context 'when case 2 work ok' do
    let(:invoice) { Invoice.new }
    let(:file) { File.open('spec/inputs/case_2.txt') }
    let(:expected) do
      <<-STRING
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
      STRING
    end

    before do
      file.readlines.each do |line|
        invoice.add_product(line)
      end
    end

    it 'print ok' do
      print.invoice = invoice
      expect(print.print).to eq expected
    end
  end

  context 'when case 3 work ok' do
    let(:invoice) { Invoice.new }
    let(:file) { File.open('spec/inputs/case_3.txt') }
    let(:expected) do
      <<-STRING
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported box of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
      STRING
    end

    before do
      file.readlines.each do |line|
        invoice.add_product(line)
      end
    end

    it 'print ok' do
      print.invoice = invoice
      expect(print.print).to eq expected
    end
  end
end