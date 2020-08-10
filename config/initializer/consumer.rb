channel = RabbitMq::Connection.consumer_channel
exchange = channel.default_exchange

queue = channel.queue("ads", durable: true)

queue.subscribe do |deleviry_info, properties, payload|
  payload = JSON.parse(payload, symbolize_names: true)
  operation = Operations::Ads::Update.new
  result = operation.call(payload)

  if result.success?
    exchange.publish(
      "",
      routing_key: properties.reply_to,
      correlation_id: properties.correlation_id
    )
  end
end
