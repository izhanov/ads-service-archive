# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.0"

gem "activerecord", require: "active_record"
gem "dotenv"
gem "dry-monads"
gem "dry-validation"
gem "fast_jsonapi"
gem "i18n"
gem "pg"
gem "puma"
gem "rake"
gem "sinatra", require: "sinatra/base"
gem "sinatra-activerecord", require: "sinatra/activerecord"
gem "sinatra-contrib"

group :test do
  gem "rack-test"
  gem "rspec"
end
