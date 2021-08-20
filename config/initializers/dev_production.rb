unless Rails.env.development?
    ENV['DB_NAME'] = 'inventory'
    ENV['DB_USER'] = 'root'
    ENV['DB_PASSWORD'] = 'admin12345'
    ENV['INVENTORY_API_DATABASE_PASSWORD']= 'admin12345'
end