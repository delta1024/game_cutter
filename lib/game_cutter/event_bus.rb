module GameCutter
  class EventBus
    def initialize
      @events = @callbacks.map { |k, _| [k, []] }.to_h
    end
    def subscribe(key, sub) 
      @events.fetch(key) << sub
    end
    def unsubscribe(key, sub)
      @events[key] = @events.fetch(key).filter { |s| not s.equal? sub }
    end
    def publish(key, val) 
      callback = @callbacks.fetch(key)
      @events[key].each { |o| callback.call(o, val) }
    end
  end
end
