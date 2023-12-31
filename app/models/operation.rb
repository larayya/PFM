class Operation < ApplicationRecord
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :odate, presence: true
  validates :description, presence: true
  belongs_to :category

def self.report_by_dates(start_date:, end_date:)
  where(odate: start_date.beginning_of_day..end_date.end_of_day)
  .group('strftime("%d-%m-%Y", operations.odate)')
  .sum(:amount)
end
end
  
# def self.report_by_category(start:, end:)
#   start_date = DateTime.parse(start).beginning_of_day
#   end_date = DateTime.parse(end).end_of_day
#   where(odate: start_date..end_date)
# end
# end


#   def self.report_by_category(start_date, end_date)
#     # Retrieve the expenses for the specified date range
#     expenses = Operation.where(date: start_date..end_date, category_id: category_id)

#     # Group the expenses by category
#     expenses_by_category = expenses.group_by(&:category)

#     # Calculate the total amount for each category
#     report_data = expenses_by_category.map do |category, expenses|
#       total_amount = expenses.sum(&:amount)
#       { category: category.name, total_amount: total_amount }
#     end

#     report_data
#   end

  
