# frozen_string_literal: true

class Scores
  TeamResult = Struct.new(:name, :position, :points) do
    def to_s
      "#{position}. #{name}, #{points} #{points == 1 ? 'pt' : 'pts'}"
    end
  end

  class Result
    attr_reader :tournament
    def initialize(tournament)
      @tournament = tournament
    end

    def leaderboard
      tournament.points
                .sort_by(&:name)
                .sort_by { |points_result| -points_result.points }
                .each.with_index.reduce([nil, []], &method(:assign_position))
                .slice(1)
    end

    private

    def assign_position((previous, list), (points_result, index))
      position =
        if previous && points_result.points == previous.points
          previous.position
        else
          index + 1
        end

      team_result =
        TeamResult.new(points_result.name, position, points_result.points)

      [team_result, list << team_result]
    end
  end
end
