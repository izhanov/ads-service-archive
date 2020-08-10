# frozen_string_literal: true

module RabbitMq
  module Connection
    extend self

    @mutex = Mutex.new

    def connection
      @mutex.synchronize do
        @connection ||= Bunny.new.start
      end
    end

    def channel
      Thread.current[:rabbitmq_channel] ||= connection.create_channel
    end

    def consumer_channel
      Thread.current[:rabbitmq_consumer_channel] ||= connection.create_channel(
        nil,
        10
      )
    end
  end
end
