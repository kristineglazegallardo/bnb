Rails.application.routes.draw do
  post '/reservations/' => 'reservations#create'
end
