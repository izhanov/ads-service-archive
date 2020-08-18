# frozen_string_literal: true

module Helpers
  module Auth
    class Unauthorized < StandardError; end

    AUTH_TOKEN = /\ABearer (?<token>.+)\z/.freeze

    def user_id
      user_id = auth_service.auth(matched_token)
      raise Unauthorized if user_id.blank?

      user_id
    end

    private

    # def auth_service
    #   @auth_service ||= Authentication::RpcClient.fetch
    # end

    def auth_service
      @auth_service ||= Authentication::Client.new
    end

    def matched_token
      result = auth_header&.match(AUTH_TOKEN)
      return if result.blank?
      puts result[:token]
      result[:token]
    end

    def auth_header
      request.env["HTTP_AUTHORIZATION"]
    end
  end
end
