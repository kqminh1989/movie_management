Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/import_excel',       to: 'movies#import_excel',       as: 'import_excel'
  get  '/excel_process_data', to: 'movies#excel_process_data', as: 'excel_process_data'
  get '/process_excel',       to: 'movies#process_excel',      as: 'process_excel'
end
