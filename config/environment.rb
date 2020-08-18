ENV["RACK_ENV"] ||= "development"

require "bundler/setup"
Bundler.require(:default, ENV["RACK_ENV"])

require "dotenv"
Dotenv.load(".env.#{ENV["RACK_ENV"]}", ".env")

require_relative "boot"
Boot.setup
