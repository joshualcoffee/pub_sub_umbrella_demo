defmodule PubSubClientTest do
  use ExUnit.Case
  doctest PubSubClient

  test "greets the world" do
    assert PubSubClient.hello() == :world
  end
end
