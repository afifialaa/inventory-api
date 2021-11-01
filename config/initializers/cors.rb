Rails.application.config.middleware.insert_before 0, Rack::Cors do
    # Angular app
    allow do
        origins 'localhost:4200'
        resource '*', headers: :any, methods: [:get, :post, :delete, :put]
    end

    # React app
    allow do
        origins 'localhost:3000'
        resource '*', headers: :any, methods: [:get, :post, :delete, :put]
    end

end
