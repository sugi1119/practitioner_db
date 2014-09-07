Rails.application.routes.draw do
  root :to => 'pages#page'
  resources :practitioners, :patients, :appointments
  resources :supplements
  resources :prescription_supplements
  # resources :invoice_menus
  resources :menus

  resources :consultations, :except => :new
  resources :invoices, :except => :new
  resources :prescriptions, :except => :new

  get '/consultations/:appointment_id/new' => 'consultations#new', :as => 'new_consultation'

  get '/invoices/:consultation_id/new' => 'invoices#new', :as => 'new_invoice'

  get '/invoices/:id/choose' => 'invoices#choose', :as => 'choose'

  post '/invoices/:id/add_menus' => 'invoices#add_menus'


  get '/prescriptions/:consultation_id/new' => 'prescriptions#new', :as => 'new_prescription'

  get '/prescriptions/:prescription_id/choose' => 'prescriptions#choose', :as => 'choose_supplements'

  post '/prescriptions/:id/add_supplements' => 'prescriptions#add_supplements'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
