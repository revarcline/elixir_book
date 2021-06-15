defmodule Exercise do
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: map([head | tail], func) |> sum()

  def max([]), do: 0
  def max([head | tail]), do: findmax(head, tail)

  def findmax(top, []), do: top
  def findmax(top, [head | tail]) when top > head, do: findmax(top, tail)
  def findmax(top, [head | tail]) when top < head, do: findmax(head, tail)

  # char range 97..122
  def caesar([], _n), do: []
  def caesar([head | tail], n) when head + n > 122, do: [head - 26 + n | caesar(tail, n)]
  def caesar([head | tail], n), do: [head + n | caesar(tail, n)]
end
