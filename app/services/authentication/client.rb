# frozen_string_literal: true

require_relative "api"

module Authentication
  class Client
    include Authentication::Api

    attr_reader :connection

    def initialize(url: "http://localhost:3010/auth/v1", connection: nil)
      @url = url
      @connection = connection || build_conection
    end

    private

    def build_conection
      Faraday.new(@url) do |conn|
        conn.request :json
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end
  end
end
