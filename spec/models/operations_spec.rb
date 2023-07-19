# my

require 'rails_helper'

RSpec.describe Operation, type: :model do
  xdescribe '.report_by_category' do
    let(:category) { 'Some Category' }
    let!(:operations) { create_list(:operation, 10, category: category) }

    it 'returns operations filtered by category' do
      result = Operation.report_by_category(category)
      expect(result).to eq(operations)
    end
  end

  describe '.report_by_dates' do
    it 'returns operations within the specified date range' do
    start_date = '2022-01-01'
    end_date = '2022-01-31'
    category = Category.create(name: 'category', description: 'category')
    20.times do
      Operation.create(
        odate: '2022-01-05',
        amount: rand(100),
        description: 'test description',
        category: category
        )
    end
       
    result = Operation.report_by_dates(start_date: start_date, end_date: end_date)
    expect(result.count).to eq(Operation.count)
    end
  end
end
