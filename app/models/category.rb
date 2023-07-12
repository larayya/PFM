class Category < ApplicationRecord
    has_many :operations
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
end
  
  # class Category < ApplicationRecord
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
  
    # ... other methods ...
  # end
  
  # class Category < ApplicationRecord
  #   def self.report_by_category(start_date, end_date)
  #     expenses_by_category = Operation
  #       .joins(:category)
  #       .where(date: start_date..end_date)
  #       .group('categories.name')
  #       .sum(:amount)
  
  #     report_data = expenses_by_category.map do |category_name, total_amount|
  #       { category: category_name, total_amount: total_amount }
  #     end
  
  #     report_data
  #   end
  
  #   # ... other methods ...
  # end
  