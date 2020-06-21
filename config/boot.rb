# frozen_string_literal: true

module Boot
  extend self

  def setup
    connect_to_db
    require_app
    initialize_app
  end

  private

  def connect_to_db
    require File.join(root, "config/initializer/db")
  end

  def require_app
    require File.join(root, "config/application")
    require File.join(root, "app/helpers/auth")
    require File.join(root, "app/helpers/pagination_links")
    require File.join(root, "app/services/authentication/api")
    require File.join(root, "app/services/operations/base")
    require File.join(root, "app/services/validations/base")
    require File.join(root, "app/services/utils/ad_serializer")
    Dir["#{root}/app/**/*.rb"].each { |file| require file }
  end

  def initialize_app
    Dir["#{root}/config/initializer/**/*.rb"].each { |file| require file }
  end

  def root
    File.expand_path("..", __dir__)
  end
end
