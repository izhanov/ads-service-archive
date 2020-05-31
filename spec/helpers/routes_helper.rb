# frozen_string_literal: true

module Features
  module RoutesHelper
    def app
      subject
    end

    def response
      OpenStruct.new(
        headers: last_response.headers,
        status: last_response.status,
        body: JSON.parse(last_response.body, symbolize_names: true)
      )
    end
  end
end
