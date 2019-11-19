defmodule Webhooks.HandleEvent do
  @moduledoc """
  A basic version of the webhooks service that Kevin has been working on.
  """
  alias PubSubClient
  alias Webhooks.Sites

  def call(
        %{
          "event" => "classRosterBooking.created",
          "siteId" => site_id,
          "locationId" => _,
          "classId" => _
        } = data
      ) do
    with true <- Sites.site_managed?(site_id) do
      PubSubClient.post("mbo.sync", data)
    end
  end

  def call(_, _), do: :ok
end
