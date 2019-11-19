defmodule MBA.PubsubConsumer do
  use Broadway

  alias Broadway.Message

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module:
          {BroadwayCloudPubSub.Producer,
           subscription: "projects/pubsub-demo-259418/subscriptions/mba"}
      ],
      processors: [
        default: []
      ],
      batchers: [
        default: [
          batch_size: 10,
          batch_timeout: 2_000
        ]
      ]
    )
  end

  def handle_message(
        _,
        %Message{
          metadata: %{attributes: %{"event" => "mba.sync"}}
        } = message,
        _
      ) do
    IO.inspect("MBA sync has been triggered")
    message
  end

  # we need to return the message to be handled in the batch
  def handle_message(
        _,
        %Message{
          metadata: %{attributes: %{"event" => event}}
        } = message,
        _
      ) do
    IO.inspect("ignored #{event} in the MBA service")
    message
  end

  def handle_batch(_, messages, _, _) do
    messages
  end
end
