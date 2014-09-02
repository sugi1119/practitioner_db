Rails.application.routes.draw do
  root :to => 'pages#page'
  resources :practitioners, :patients, :appointments
  resources :supplements

  resources :consultations, :except => :new
  resources :prescriptions, :except => :new

  get '/consultations/:appointment_id/new' => 'consultations#new', :as => 'new_consultation'

  get '/prescriptions/:consultation_id/new' => 'prescriptions#new', :as => 'new_prescription'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
