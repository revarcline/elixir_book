defmodule Primes do
  def span(from, to) when to < from,
    do: raise(ArgumentError, "second argument must be greater than first")

  def span(from, from), do: [from]
  def span(from, to), do: [from | span(from + 1, to)]

  def find(n) when n < 2, do: raise(ArgumentError, "argument must be greater than 2")

  def find(n) do
    range = span(2, n)
    excludes = for a.inlist(range), b.inlist(range), a <= b, a * b <= n, do: a * b
    range -- excludes
  end
end
