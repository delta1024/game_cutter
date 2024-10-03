module GameCutter
  class Game
    attr_accessor :should_close
    attr_reader :window
    def run
      window.spawn do 
        until should_close 
          update
          window.draw do 
            draw
          end
        end
      end
    end
    def change_screen screen
      @screen = screen
    end
    private
    def update
      @screen.update
    end
    def draw
      @screen.draw
    end
  end
end
