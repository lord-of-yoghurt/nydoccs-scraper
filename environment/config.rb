ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require

# DB connection when needed

require_all 'app'
require_all 'lib'
