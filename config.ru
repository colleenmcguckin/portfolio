# ./config.ru

require 'rack/unreloader'
Unreloader = Rack::Unreloader.new{Portfolio}

require 'roda'
require 'forme/erb'

Unreloader.require './portfolio.rb'
run Unreloader
