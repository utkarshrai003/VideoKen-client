Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'dashboard#show'
  post '/create_user' => 'dashboard#create_user'
  post '/create_appointment' => 'dashboard#create_appointment'
end
