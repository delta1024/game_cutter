# frozen_string_literal: true

require "raylib"
require_relative "game_cutter/version"

module GameCutter
  class Error < StandardError; end
  autoload(:Game, "game_cutter/game")
  autoload(:Window, "game_cutter/window")
end
