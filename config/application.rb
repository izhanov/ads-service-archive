# frozen_string_literal: true

require "sinatra/base"
require "sinatra/contrib"
require "sinatra/custom_logger"
require "rack/ougai"
require "dry/monads"
require "dry/monads/result"
require "dry/validation"
require "dry/schema/messages/i18n"


class Application < Sinatra::Base
  helpers Sinatra::CustomLogger

  include Dry::Monads[:result]

  configure do
    register Sinatra::Namespace
    set :app_file, File.expand_path("../config.ru", __dir__)
  end

  configure :development do
    register Sinatra::Reloader

    set :show_exceptions, false
  end
end
