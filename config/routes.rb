Rails.application.routes.draw do
  post '/guest_reservations/' => 'guest_reservations#create'
end
