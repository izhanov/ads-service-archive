ENV["APP_ENV"] ||= "development"

require "bundler"
Bundler.setup(:default, ENV["APP_ENV"])

require "dotenv"
Dotenv.load(".env.#{ENV["APP_ENV"]}", ".env")

require_relative "boot"
Boot.setup
