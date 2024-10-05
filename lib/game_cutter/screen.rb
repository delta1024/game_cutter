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
  class OverlayScreen < Screen
    def initialize(game, screen)
      @game = game
      @screen = screen
      @objects = []
    end
    def draw
      @screen.draw()
      message_size = Raylib.measure_text @text, @font_size
      tx = game.window.width / 2 - message_size / 2
      ty = game.window.height / 2 - @font_size / 2
      Raylib.draw_text @text, tx, ty, @font_size, @color
    end
  end
end
