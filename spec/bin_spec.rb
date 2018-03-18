# frozen_string_literal: true
require "spec_helper"

describe "bin/scores" do
  it "returns an error when STDIN or a file name is not provided" do
    result = `ruby ./bin/scores`

    expect(result).to match /No file name provided/
    expect($?.exitstatus).to eql 1
  end

  it "returns an error when a given file doesn't exist" do
    result = `ruby ./bin/scores 404.txt`

    expect(result).to match /File doesn't exist/
    expect($?.exitstatus).to eql 1
  end

  it "parses a file" do
    result = `ruby ./bin/scores spec/example_input.txt`

    expect(result).to match <<~EOL
    1. Tarantulas, 6 pts
    2. Lions, 5 pts
    3. FC Awesome, 1 pt
    3. Snakes, 1 pt
    5. Grouches, 0 pts
    EOL
    expect($?.exitstatus).to eql 0
  end

  it "parses stdin" do
    result = `cat spec/example_input.txt | ruby ./bin/scores`

    expect(result).to match <<~EOL
    1. Tarantulas, 6 pts
    2. Lions, 5 pts
    3. FC Awesome, 1 pt
    3. Snakes, 1 pt
    5. Grouches, 0 pts
    EOL
    expect($?.exitstatus).to eql 0
  end

  it "handles rubbish" do
    result = `echo "What doth life?" | ruby ./bin/scores`

    expect(result).to match "An error occurred while parsing"
    expect($?.exitstatus).to eql 2
  end
end
