

Rails.application.routes.draw do
  get 'reports/index'
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  get 'main/index'
  resources :operations
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

# Для створення головної сторінки та роботи зі звітами, виконайте наступні кроки:

# Створіть контролер "Main" з методом дії (action) "index". Використовуйте генератор, 
# який автоматично створить шаблон для перегляду (view), а також додаток запису у файлі конфігурації маршрутів config/routes.rb.
#  Виконайте команду:
# rails generate controller Main index


#  У файлі config/routes.rb додайте наступний запис для кореневого маршруту:
# root "main#index"
# Це забезпечить те, що при запуску додатку головна сторінка буде відображатись за адресою "/".

# chat У файлі конфігурації маршрутів config/routes.rb додайте маршрути до всіх методів дій (actions) контролера "Reports".
#  Ви можете додати наступні записи:
# get 'reports/index'
# get 'reports/report_by_category'
# get 'reports/report_by_dates'
