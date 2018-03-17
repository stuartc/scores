# frozen_string_literal: true
class Scores
  class Game
    attr_reader :sides

    def initialize(side_a, side_b)
      @sides = [side_a, side_b]
    end

    def winner
      sides.max(&method(:compare_score)) unless tie?
    end

    def loser
      sides.min(&method(:compare_score)) unless tie?
    end

    def tie?
      sides.map { |side| side[:score] }.uniq.count == 1
    end

    def team_names
      sides.map { |side| side[:name] }
    end

    private

    def compare_score(a, b)
      a[:score] <=> b[:score]
    end
  end
end
