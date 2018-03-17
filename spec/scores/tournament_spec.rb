# frozen_string_literal: true

require 'spec_helper'

describe Scores::Tournament do
  let(:tournament) { described_class.new(games) }
  let(:games) { build_games }

  describe 'attributes' do
    subject { tournament.games }
    it { is_expected.to eql games }
  end

  describe '#team_names' do
    subject { tournament.team_names }

    it do
      is_expected.to contain_exactly(
        'Lions', 'Snakes', 'FC Awesome', 'Grouches', 'Tarantulas'
      )
    end
  end

  describe '#points' do
    subject { tournament.points }

    it do
      is_expected.to contain_exactly(
        have_attributes(name: 'Lions', points: 1 + 1 + 3),
        have_attributes(name: 'Snakes', points: 1 + 0),
        have_attributes(name: 'FC Awesome', points: 0 + 1),
        have_attributes(name: 'Grouches', points: 0),
        have_attributes(name: 'Tarantulas', points: 3 + 3)
      )
    end
  end
end
