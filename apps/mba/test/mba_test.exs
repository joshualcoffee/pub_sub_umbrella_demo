defmodule MBATest do
  use ExUnit.Case
  doctest MBA

  test "greets the world" do
    assert MBA.hello() == :world
  end
end
