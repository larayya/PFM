# chat
# class ReportsController < ApplicationController
#   def index

#   end
  
#   def report_by_category
#     category = params[:category]
#     @operations = Operation.where(category: category)
#   end

#   def report_by_dates
#     start_date = params[:start_date]
#     end_date = params[:end_date]
#     @operations = Operation.where(date: start_date..end_date)
#   end

  
# end

# class ReportsController < ApplicationController
#   def index
#     # show categories
#     @categories = Category.all 
#   end
  class ReportsController < ApplicationController
    def index
      @categories = Category.all
      @operations_count = Operation.count
    end
   
  def report
    if params[:btn_date]
      redirect_to({ 
        action: "report_by_date", 
        start_date: params[:start_date], 
        end_date: params[:end_date]
      })
    elsif
      redirect_to({ 
        action: "report_by_category", 
        start_date: params[:start_date], 
        end_date: params[:end_date]
      })
    end
  end

  def report_by_category
    @data = params
  end

  def report_by_date
    @data = params
  end
end

# class ReportsController < ApplicationController
#   def index
#   end

#   def report
#     if params[:btn_date]
#       redirect_to({
#         action: "report_by_date",
#         start_date: params[:start_date],
#         end_date: params[:end_date]
#       })
#     elsif params[:btn_category] # Add this condition
#       redirect_to({
#         action: "report_by_category",
#         category: params[:category]
#       })
#     end
#   end
# end
