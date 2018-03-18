# frozen_string_literal: true

class Scores
  class << self
    def parse!(input)
      tournament =
        Tournament.new input.split("\n").map(&Parser.method(:from_string))
      Result.new(tournament)
    end
  end
end

require 'scores/result'
require 'scores/tournament'
require 'scores/game'
require 'scores/parser'
