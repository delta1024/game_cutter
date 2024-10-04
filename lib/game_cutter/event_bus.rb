module GameCutter
  class EventBus
    def initialize
      @events = @callbacks.map { |k, _| [k, []] }.to_h
    end
    def subscribe(*vals) 
      vals.each_slice(2) do |key, sub|
        @events.fetch(key) << sub
      end
    end
    def unsubscribe(*vals)
      vals.each_slice(2) do |key, sub|
        @events[key] = @events.fetch(key).filter { |s| not s.equal? sub }
      end
    end

    def publish(*vals) 
      vals.each_slice(2) do |key, val|
        callback = @callbacks.fetch(key)
        @events[key].each { |o| callback.call(o, val) }
      end
    end
  end
end
