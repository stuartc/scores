# frozen_string_literal: true

class Scores
  class Parser
    class << self
      def from_string(str)
        results =
          str.scan(/((?<team>\w+)\ (?<score>\d\d?))+/)
             .map { |(name, score)| { name: name, score: score.to_i } }

        Game.new(*results)
      end
    end
  end
end
