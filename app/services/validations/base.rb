# frozen_string_literal: true

module Validations
  class Base < Dry::Validation::Contract
    config.messages.backend = :i18n
    config.messages.load_paths << "#{Application.root}/config/locales/errors/errors.en.yml"
    config.messages.load_paths << "#{Application.root}/config/locales/errors/errors.ru.yml"
  end
end
