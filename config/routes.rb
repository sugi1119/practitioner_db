Rails.application.routes.draw do
  root :to => 'pages#page'
  resources :practitioners, :patients, :appointments

  resources :consultations, :except => :new

  get '/consultations/:appointment_id/new' => 'consultations#new', :as => 'new_consultation'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
