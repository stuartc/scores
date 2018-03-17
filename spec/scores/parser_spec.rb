# frozen_string_literal: true

require 'spec_helper'

describe Scores::Parser do
  context 'from_string' do
    subject { described_class.from_string(string) }

    context 'when valid' do
      let(:string) { 'Lions 3, Snakes 3' }
      it 'returns a valid instance of Game' do
        is_expected.to be_an_instance_of(Scores::Game)
        is_expected.to have_attributes(
          sides: [{ name: 'Lions', score: 3 }, { name: 'Snakes', score: 3 }]
        )
      end
    end
    context 'when invalid' do
      let(:string) { 'Lions, Snakes 3' }
      it 'throws an exception' do
        expect(-> { subject }).to raise_exception ArgumentError
      end
    end
  end
end
