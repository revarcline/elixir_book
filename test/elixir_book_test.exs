defmodule ElixirBookTest do
  use ExUnit.Case
  doctest ElixirBook

  test "greets the world" do
    assert ElixirBook.hello() == :world
  end
end
