defmodule PubSubClient do
  def post(event, data) do
    topic = %Kane.Topic{name: "general_topic"}

    message = %Kane.Message{
      data: data,
      attributes: %{event: event}
    }

    Kane.Message.publish(message, topic)
  end
end
