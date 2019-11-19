defmodule MBA.SyncService do
  alias PubSubClient

  @moduledoc """
  This module represents a sync in MBO.

  Im not entirely sure when a new site would be added and when the
  webhooks service needs to be notified.
  """

  def add_site(site_id), do: PubSubClient.post("webhooks.siteAdded", %{site_id: site_id})
end
