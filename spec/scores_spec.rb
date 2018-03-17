# frozen_string_literal: true

require 'spec_helper'

describe Scores do
  context 'parse!' do
    let(:example) do
      File.read('spec/example_input.txt')
    end

    subject { described_class.parse!(example) }

    it do
      is_expected.to be_an_instance_of(Scores::Result)
    end
  end
end
