# frozen_string_literal: true

require "sinatra/activerecord"
require "sinatra/base"
require "sinatra/contrib"
require "dry/monads"
require "dry/validation"

class Application < Sinatra::Base
  include Dry::Monads[:result]

  configure :development do
    register Sinatra::Reloader

    set :show_exceptions, false
  end
end
