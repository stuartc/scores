# frozen_string_literal: true

class Scores
  PointResult = Struct.new(:name, :points) do
    class << self
      def from_hash((name, points))
        new(name, points)
      end
    end
  end

  class Tournament
    include Enumerable

    attr_reader :games

    def initialize(games)
      @games = games
    end

    def each(&block)
      games.each(&block)
    end

    def team_names
      flat_map(&:team_names).uniq
    end

    def points
      initial_scores = Hash[*team_names.flat_map { |name| [name, 0] }]

      reduce(initial_scores, &method(:add_scores))
        .map(&PointResult.method(:from_hash))
    end

    private

    def add_scores(scores, game)
      if game.tie?
        game.sides.map { |side| side[:name] }.each do |tied_sides|
          scores[tied_sides] += 1
        end
      else
        scores[game.winner[:name]] += 3
        scores[game.loser[:name]] += 0
      end

      scores
    end
  end
end
