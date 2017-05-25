ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# DB connection when/if needed

require_all 'app'
require_all 'lib'
