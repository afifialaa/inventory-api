unless Rails.env.production?
    ENV['DB_NAME'] = 'inventory'
    ENV['DB_USER'] = 'root'
    ENV['DB_ROOT_PASSWORD'] = 'root12345'
    ENV['DB_PASSWORD'] = 'root12345'
    ENV['INVENTORY_API_DATABASE_PASSWORD']
end