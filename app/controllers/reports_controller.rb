class ReportsController < ApplicationController
  def index
      @categories = Category.all
      @operations_count = Operation.count
  end
   
  def report
    if params[:report_by_dates]
      redirect_to({ 
        action: "report_by_dates", 
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
      if params[:start_date].present? && params[:end_date].present?
        start_date = DateTime.strptime(params[:start_date], "%m/%d/%Y")
        end_date = DateTime.strptime(params[:end_date], "%m/%d/%Y")
        @categories = Category.report_by_categories(start_date: start_date, end_date: end_date)
    else
        # Встановлення значень за замовчуванням або повідомлення про помилку
        flash.now[:alert] = "Please provide valid start and end dates."
        @categories = Category.all 
    end
  end
            
  def report_by_dates
    @data = params
    if params[:start_date].present? && params[:end_date].present?
        start_date = DateTime.strptime(params[:start_date], "%m/%d/%Y")
        end_date = DateTime.strptime(params[:end_date], "%m/%d/%Y")
        @operations = Operation.report_by_dates(start_date: start_date, end_date: end_date)
    else
        # Встановлення значень за замовчуванням або повідомлення про помилку
        flash.now[:alert] = "Please provide valid start and end dates."
        @operations = [] # або @operations = Operation.all або інше значення за замовчуванням
        render :index # або інше представлення, в якому ви виводите дані
    end
  
  end
end
    
  