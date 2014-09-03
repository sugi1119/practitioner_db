Rails.application.routes.draw do
  root :to => 'pages#page'
  resources :practitioners, :patients, :appointments
  resources :supplements
  resources :prescription_supplements
  resources :invoices, :servicemenus

  resources :consultations, :except => :new
  resources :prescriptions, :except => :new

  get '/consultations/:appointment_id/new' => 'consultations#new', :as => 'new_consultation'

  get '/prescriptions/:consultation_id/new' => 'prescriptions#new', :as => 'new_prescription'

  get '/prescriptions/:prescription_id/choose' => 'prescriptions#choose', :as => 'choose_supplements'

  post '/prescriptions/:id/add_supplements' => 'prescriptions#add_supplements'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
