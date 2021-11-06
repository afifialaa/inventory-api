Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    namespace :api do
        namespace :v1 do
            # User routes
            post '/user/signup', to: 'users#create'
            post '/user/login', to: 'users#show'
            delete '/user', to: 'users#destroy'

            # Products routes
            post '/product', to: 'products#create'
            delete '/product/:id', to: 'products#destroy'
            put '/product/:id', to: 'products#update'
            get '/product/:id', to: 'products#show'
            get '/products', to: 'products#index'
            get '/products/count/all', to: 'products#count_all'

            # Suppliers routes
            post '/supplier', to: 'suppliers#create'
            delete '/supplier/:id', to: 'suppliers#destroy'
            put '/supplier/:id', to: 'suppliers#update'
            get '/supplier/:id', to: 'suppliers#show'
            get '/supplier', to: 'suppliers#index'
            get '/supplier/count/products', to: 'suppliers#count_products'

            # Categories routes
            post '/category', to: 'categories#create'
            delete '/category/:id', to: 'categories#destroy'
            put '/category/:id', to: 'categories#update'
            get '/category/:id', to: 'categories#show'
            get '/category', to: 'categories#index'

            # Warehouse routes
            post '/warehouse', to: 'warehouses#create'
            get '/warehouse/:id', to: 'warehouses#show'
            get '/warehouse', to: 'warehouses#index'
            delete '/warehouse/:id', to: 'warehouses#destroy'
            put '/warehouse/:id', to: 'warehouses#update'
        end
    end
    

end
