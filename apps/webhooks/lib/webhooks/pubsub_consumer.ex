defmodule Webhooks.PubsubConsumer do
  use Broadway
  alias Webhooks.Sites
  alias Broadway.Message

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module:
          {BroadwayCloudPubSub.Producer,
           subscription: "projects/pubsub-demo-259418/subscriptions/webhooks"}
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
          data: data,
          metadata: %{attributes: %{"event" => "webhooks.siteAdded"}}
        } = message,
        _
      ) do
    with {:ok, data} <- Jason.decode(data) do
      IO.inspect("site added to webhooks service")
      Sites.add_site(Map.get(data, "site_id"))
    end

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
    IO.inspect("ignored #{event} in the Webhooks service")
    message
  end

  def handle_batch(_, messages, _, _) do
    messages
  end
end
