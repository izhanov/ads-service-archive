# frozen_string_literal: true

require "byebug"

module Authentication
  module Api
    def auth(token)
      response = connection.post("authenticate") do |request|
        request.headers["Authorization"] = "Bearer #{token}"
      end

      response.body.dig("meta", "user_id") if response.success?
    end
  end
end
