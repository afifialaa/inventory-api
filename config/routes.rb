Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    namespace :api do
        namespace :v1 do
            # User routes
            post '/users/signup', to: 'users#create'
            post '/users/login', to: 'users#show'
            delete '/users', to: 'users#destroy'

            # Products routes
            post '/products', to: 'products#create'
            delete '/products/:id', to: 'products#destroy'
            put '/products/:id', to: 'products#update'
            get '/products/:id', to: 'products#show'
            get '/inventory/products', to: 'products#index'
            get '/products/count/all', to: 'products#count_all'

            # Suppliers routes
            post '/suppliers', to: 'suppliers#create'
            delete '/suppliers/:id', to: 'suppliers#destroy'
            put '/suppliers/:id', to: 'suppliers#update'
            get '/suppliers/:id', to: 'suppliers#show'
            get '/suppliers', to: 'suppliers#index'
            get '/suppliers/count/products', to: 'suppliers#count_products'

            # Categories routes
            post '/categories', to: 'categories#create'
            delete '/categories/:id', to: 'categories#destroy'
            put '/categories/:id', to: 'categories#update'
            get '/categories/:id', to: 'categories#show'
            get '/categories', to: 'categories#index'

            # Warehouse routes
            post '/warehouse', to: 'warehouses#create'
            get '/warehouse/:id', to: 'warehouses#show'
            get '/warehouse', to: 'warehouses#index'
            delete '/warehouse/:id', to: 'warehouses#destroy'
            put '/warehouse/:id', to: 'warehouses#update'
        end
    end
    
    

    

    

    

    

end
