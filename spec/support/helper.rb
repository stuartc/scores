module Helper
  def build_tournament
    Scores::Tournament.new(build_games)
  end

  def build_games
    [
      [{name: "Lions", score: 3}, {name: "Snakes", score: 3}],
      [{name: "Tarantulas", score: 1}, {name: "FC Awesome", score: 0}],
      [{name: "Lions", score: 1}, {name: "FC Awesome", score: 1}],
      [{name: "Tarantulas", score: 3}, {name: "Snakes", score: 1}],
      [{name: "Lions", score: 4}, {name: "Grouches", score: 0}]
    ].map do |sides|
      Scores::Game.new(*sides)
    end
  end
end
