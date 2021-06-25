defmodule Stats do
  @moduledoc "sample stats module for testing"
  def sum(vals), do: vals |> Enum.reduce(0, &+/2)
  def count(vals), do: vals |> length
  def average(vals), do: sum(vals) / count(vals)
end
