# frozen_string_literal: true

require "active_record"

ActiveRecord::Base.establish_connection(
  ENV["DATABASE_URL"]
)
