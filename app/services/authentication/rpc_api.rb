# frozen_string_literal: true


module Authentication
  module RpcApi
    def auth(token)
      payload = { token: token }.to_json
      publish(payload, type: "token")
    end
  end
end
