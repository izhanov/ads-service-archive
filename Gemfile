# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.0"

gem "activerecord", require: "active_record"
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
gem "rake"
gem "sinatra", require: "sinatra/base"
gem "sinatra-activerecord", require: "sinatra/activerecord"
gem "sinatra-contrib"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
end

group :test do
  gem "database_cleaner-active_record"
  gem "factory_bot"
  gem "rack-test"
  gem "rspec"
end
