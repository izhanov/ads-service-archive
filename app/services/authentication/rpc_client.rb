# frozen_string_literal: true

require_relative "rpc_api"

module Authentication
  class RpcClient
    include Authentication::RpcApi

    def initialize
      @channel = create_channel
      @queue = @channel.queue("authentication", durable: true)
      @reply_queue = @channel.queue("authentication.reply-to")
      @lock = Mutex.new
      @condition = ConditionVariable.new
      @correlation_id = SecureRandom.uuid
    end

    def self.fetch
      Thread.current["auth_service.rpc_client"] ||= new.start
    end

    def start
      @reply_queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
        if @correlation_id == properties[:correlation_id]
          @user_id = JSON.parse(payload).dig("user_id")
          @delivery_tag = delivery_info.delivery_tag
          @lock.synchronize { @condition.signal }
        end
      end

      self
    end

    private

    def publish(payload, opts = {})
      @lock.synchronize do
        @queue.publish(
          payload,
          opts.merge(
            app_id: "ads",
            correlation_id: @correlation_id,
            reply_to: @reply_queue.name
          )
        )
        @condition.wait(@lock)

        @reply_queue.channel.ack(@delivery_tag)

        @user_id
      end
    end

    def create_channel
      RabbitMq::Connection.channel
    end
  end
end
