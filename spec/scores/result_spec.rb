# frozen_string_literal: true

require 'spec_helper'

describe Scores::Result do
  let(:result) { described_class.new(tournament) }
  let(:tournament) { build_tournament }

  describe 'attributes' do
    subject { result.tournament }
    it { is_expected.to eql(tournament) }
  end

  describe '#leaderboard' do
    subject { result.leaderboard }

    it do
      is_expected.to match [
        have_attributes(name: 'Tarantulas', position: 1, points: 6),
        have_attributes(name: 'Lions', position: 2, points: 5),
        have_attributes(name: 'FC Awesome', position: 3, points: 1),
        have_attributes(name: 'Snakes', position: 3, points: 1),
        have_attributes(name: 'Grouches', position: 5, points: 0)
      ]
    end
  end
end
