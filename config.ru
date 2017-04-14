# ./config.ru

require 'rack/unreloader'
Unreloader = Rack::Unreloader.new{Portfolio}

require 'roda'

Unreloader.require './portfolio.rb'
run Unreloader
