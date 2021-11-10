class Rack::Attack

    Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

    Rack::Attack.throttle("requests by ip", limit: 5, period: 5) do |request|
        request.ip
    end
end
