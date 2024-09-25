defmodule AsanaTest do
  use ExUnit.Case
  doctest Asana

  test "greets the world" do
    assert Asana.hello() == :world
  end
end
