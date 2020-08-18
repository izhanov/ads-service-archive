# frozen_string_literal: true

Application.configure do |app|
  logger = Ougai::Logger.new(
    app.root.concat("/", ENV["LOGGER_PATH"]),
    level: "info"
  )

  logger.before_log = lambda { |data| data[:service] = { name: ENV["APP_NAME"] }  }
  app.set :logger, logger
end

Application.configure :development do |app|
  logger = Ougai::Logger.new(
    STDOUT,
    level: "info"
  )

  logger.formatter = Ougai::Formatters::Readable.new
  app.set :logger, logger
end

Sequel::Model.db.loggers.push(Application.logger)
