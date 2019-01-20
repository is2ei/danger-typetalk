$LOAD_PATH.unshift File.expand_path(__dir__)
$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'rspec'
require 'rack/test'
require 'danger'
require 'danger_plugin'
