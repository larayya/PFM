
Rails.application.routes.draw do
  get 'reports/index'
  get 'basic_report', to: 'reports#report'
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  get '/reports', to: 'reports#index'
  resources :operations
  resources :categories
  root "main#index"
end
