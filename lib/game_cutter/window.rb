module GameCutter
  class Window
    attr_accessor :log_level
    attr_reader :width, :height, :title, :fps

    def initialize(width, height, title, setup: nil, fps: 60)
      @setup = setup
      @width = width
      @height = height
      @title = title
      @fps = fps
    end
    def spawn(&block)
      if not @log_level.nil?
        Raylib.set_trace_log_level @log_level
      end
      Raylib.init_window width, height, title
      Raylib.set_target_fps fps
      if not @setup.nil?
        @setup.call
      end
      block.call
    ensure
      Raylib.close_window
    end
    def draw(&block)
      Raylib.begin_drawing
      block.call
    ensure
      Raylib.end_drawing
    end
  end
end



