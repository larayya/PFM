# my

require 'rails_helper'

RSpec.describe Operation, type: :model do
  describe '.report_by_category' do
    let(:category) { 'Some Category' }
    let!(:operations) { create_list(:operation, 10, category: category) }

    it 'returns operations filtered by category' do
      result = Operation.report_by_category(category)
      expect(result).to eq(operations)
    end
  end

  describe '.report_by_dates' do
    let(:start_date) { '2022-01-01' }
    let(:end_date) { '2022-01-31' }
    let!(:operations) { create_list(:operation, 20, date: start_date..end_date) }

    it 'returns operations within the specified date range' do
      result = Operation.report_by_dates(start_date, end_date)
      expect(result).to eq(operations)
    end
  end
end
