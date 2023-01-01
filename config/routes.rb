Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/mysql_operations', to: 'mysql_operations#operation'
end
