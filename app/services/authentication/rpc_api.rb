# frozen_string_literal: true

module Authentication
  module RpcApi
    def auth(token)
      payload = { token: "Bearer #{token}" }.to_json
      publish(payload, type: "token")
    end
  end
end
