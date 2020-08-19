# frozen_string_literal: true

Sequel.connect(ENV["DATABASE_URL"]) # DB object

Sequel::Model.db.extension(:pagination)
Sequel::Model.plugin :timestamps, update_on_create: true
Sequel::Model.plugin :dataset_associations

Sequel.default_timezone = :utc
