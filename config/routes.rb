Rails.application.routes.draw do
  root :to => 'pages#page'
  resources :practitioners, :patients, :appointments, :consultations

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
