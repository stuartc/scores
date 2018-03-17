$:.unshift File.expand_path("#{File.dirname(__FILE__)}/../")
Dir['spec/support/*.rb'].each { |f| require f }

require "lib/scores"

RSpec.configure do |config|
  config.include Helper
end
