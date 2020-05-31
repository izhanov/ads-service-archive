# frozen_string_literal: true

module Utils
  class AdSerializer
    include FastJsonapi::ObjectSerializer

    attributes :title, :description, :city, :user_id, :lon, :lat
  end
end
