defmodule Webhooks.Sites do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args) do
    {:ok, []}
  end

  def add_site(site_id), do: GenServer.cast(__MODULE__, {:add_site, site_id})

  def handle_cast({:add_site, site}, sites), do: {:noreply, [site | sites]}

  def site_managed?(site_id), do: GenServer.call(__MODULE__, {:site_managed, site_id})

  def handle_call({:site_managed, site_id}, _from, sites),
    do: {:reply, Enum.member?(sites, site_id), sites}
end
