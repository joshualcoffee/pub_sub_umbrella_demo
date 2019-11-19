defmodule MBOTest do
  use ExUnit.Case
  doctest MBO

  test "greets the world" do
    assert MBO.hello() == :world
  end
end
