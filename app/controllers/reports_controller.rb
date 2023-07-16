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
      @categories = Category.all
    end
     
    def report_by_dates
      @data = params
      @operations = Operation.order(:date)
    end
            
  end
  