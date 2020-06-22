# frozen_string_literal: true

module Geocoder
  class Determine
    attr_reader :connection

    def initialize(url: "http://localhost:3010/geo/v1/", connection: nil)
      @url = url
      @connection = connection || build_connection
    end

    def call(city)
      payload = {}
      payload[:city] = city

      response = @connection.post("coordinates", payload)
      response.success? ? response.body : {}
    end

    private

    def build_connection
      Faraday.new(@url) do |conn|
        conn.request :json
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end
  end
end
