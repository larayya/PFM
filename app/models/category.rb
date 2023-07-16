class Category < ApplicationRecord
    has_many :operations
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
  def calculate_amount
      operations.sum(:amount)
  end
end

