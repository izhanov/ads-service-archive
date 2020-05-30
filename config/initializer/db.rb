# frozen_string_literal: true

require "active_record"
require "kaminari"

ActiveRecord::Base.establish_connection(
  ENV["DATABASE_URL"]
)
