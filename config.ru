# frozen_string_literal: true

require_relative "./config/environment"

map "/ads" do
  run AdvertisingsRoutes.new
end
