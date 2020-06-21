# frozen_string_literal: true

module Features
  module ClientHelper
    def connecttion
      Faraday.new do |conn|
        conn.request :json
        conn.response :json, content_type: /\bjson$/
        conn.adapter :test, stubs
      end
    end

    def stubs
      @stubs ||= Faraday::Adapter::Test::Stubs.new
    end
  end
end
