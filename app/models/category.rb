class Category < ApplicationRecord
    has_many :operations
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
  def calculate_amount
      operations.sum(:amount)
  end
  def self.report_by_categories(start_date:, end_date:)
    Category.joins(:operations)
           .where(operations: { odate: start_date.beginning_of_day..end_date.end_of_day })
           .group(:name)
           .sum('operations.amount')
  end
end

