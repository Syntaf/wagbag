Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'dashboard#index'
  get '/list', to: 'dashboard#list'

  post '/sms', to: 'sms#inbound'
end
