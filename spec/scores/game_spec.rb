# frozen_string_literal: true

require 'spec_helper'

describe Scores::Game do
  let(:game) { described_class.new(side_a, side_b) }
  let(:side_a) { { name: 'Lions', score: 3 } }
  let(:side_b) { { name: 'Snakes', score: 2 } }

  describe 'attributes' do
    subject { game.sides }
    it { is_expected.to contain_exactly(side_a, side_b) }
  end

  describe '#winner' do
    subject { game.winner }
    it { is_expected.to eql side_a }
  end

  describe '#loser' do
    subject { game.loser }
    it { is_expected.to eql side_b }
  end

  describe '#tie?' do
    let(:side_a) { { name: 'Lions', score: 1 } }
    subject { game.tie? }

    context 'when tied' do
      let(:side_b) { { name: 'FC Awesome', score: 1 } }
      it { is_expected.to be true }
    end

    context 'when not tied' do
      let(:side_b) { { name: 'FC Awesome', score: 2 } }
      it { is_expected.to be false }
    end
  end
end
