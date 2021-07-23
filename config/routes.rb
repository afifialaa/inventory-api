Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  post '/suppliers', to: 'suppliers#create'
  delete '/suppliers/:id', to: 'suppliers#destroy'
  put '/suppliers/:id', to: 'suppliers#update'
  get '/suppliers/:id', to: 'suppliers#show'
  get '/suppliers', to: 'suppliers#index'

  post '/products', to: 'products#create'
  delete '/products/:id', to: 'products#destroy'
  put '/products/:id', to: 'products#update'
  get '/products/:id', to: 'products#show'
  get '/products', to: 'products#index'

end
