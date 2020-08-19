# frozen_string_literal: true

module GeocoderService
  class Client
    include GeocoderService::Api

    def initialize
      @channel = create_channel
      @queue = @channel.queue("geocoding", durable: true)
    end

    private

    def create_channel
      RabbitMq::Connection.channel
    end

    def publish(payload, opts = {} )
      @queue.publish(
        payload,
        opts.merge(
          persistent: true,
          app_id: ENV["APP_NAME"],
          headers: {
            request_id: Thread.current[:request_id]
          }
        )
      )
    end
  end
end
