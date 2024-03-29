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
            get '/suppliers', to: 'suppliers#index'
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

            # Employees routes
            post '/employee', to: 'employees#create'
            get '/employee/:id', to: 'employees#show'
            get '/employee', to: 'employees#index'
            delete '/employee/:id', to: 'employees#destroy'
            put '/employee/:id', to: 'employees#update'
            get '/employee/count', to: 'employees#count_all'

            # Customer routes
            post '/customer', to: 'customers#create'
            get '/customer/:id', to: 'customers#show'
            delete '/customer/:id', to: 'customers#destroy'
            put '/customer/:id', to: 'customers#update'
            get '/customer', to: 'customers#index'

            # Order routes
            post '/order', to: 'orders#create'
            post '/order/:id', to: 'orders#add_item'
            get '/order/:id', to: 'orders#show'
            get '/order', to: 'orders#index'
            delete '/order/:id', to: 'orders#destroy'
            get '/order/customer/:customer_id', to: 'orders#show_customer_orders'

            # Order details routes
            get '/order/:id/details', to: 'orders#show_order_details'
            get '/order/:id/details/products', to: 'orders#show_order_products'

            # Product_Warehouse routes
            get '/inventory/warehouse/:id/product/:id', to: 'products_warehouses#show'
            post '/inventory/warehouse/product', to: 'products_warehouses#create'
            delete '/inventory/warehouse/:warehouse_id/product/:product_id', to: 'products_warehouses#destroy'
            put '/inventory/warehouse/:warehouse_id/product/:product_id', to: 'products_warehouses#update'

        end
    end
    

end
