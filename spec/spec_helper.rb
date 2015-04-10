$:.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
$:.unshift File.expand_path(File.dirname(__FILE__))

ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
require 'rspec'
require 'mongoid-rspec'
require './config/environment.rb'

Mongoid.load!('config/mongoid.yml')

RSpec.configure do |config|
  config.include Mongoid::Matchers

  # Clean/Reset Mongoid DB prior to running each test.
  config.before(:each) do
    Mongoid::Sessions.default.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end
