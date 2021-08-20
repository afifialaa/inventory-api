unless Rails.env.production?
    ENV['DB_NAME'] = 'inventory'
    ENV['DB_USER'] = 'root'
    ENV['DB_ROOT_PASSWORD'] = 'admin12345'
    ENV['DB_PASSWORD'] = ''
    ENV['INVENTORY_API_DATABASE_PASSWORD']
end