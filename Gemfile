# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.0"

gem "amazing_print"
gem "bunny", "~> 2.15.0"
gem "dotenv"
gem "dry-monads"
gem "dry-validation"
gem "faraday", "~> 1.0.1"
gem "faraday_middleware", "~> 1.0.0"
gem "fast_jsonapi"
gem "i18n"
gem "kaminari"
gem "pg"
gem "puma"
gem "rack-ougai"
gem "rake"
gem "sequel", "~> 5.32.0"
gem "sinatra", require: "sinatra/base"
gem "sinatra-contrib"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
end

group :test do
  gem "database_cleaner-sequel"
  gem "factory_bot"
  gem "rack-test"
  gem "rspec"
end
