env = ENV['ENV'] || 'development'
require 'bundler'
Bundler.setup(:default, env)

require 'dotenv'
Dotenv.load("#{env}.env", "#{env}.env.overrides")
