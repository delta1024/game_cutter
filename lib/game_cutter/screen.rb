require 'raylib'
module GameCutter
  class Screen
    attr_reader   :game 
    attr_accessor :background
    def initialize(game, background: Raylib::Colors::RAYWHITE)
      @objects = []
      @game = game
      @background = background
    end
    def update
      if should_close
        game.should_close = true
        return
      end
      @objects.each do |o|
        if o.respond_to? :update
          o.update game
        end
      end
    end
    def draw
        Raylib.clear_background @background
        @objects.each do |o|
          if o.respond_to? :draw
            o.draw
          end
        end
    end
    private
    def should_close
      Raylib.window_should_close
    end
  end
end
