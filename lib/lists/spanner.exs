defmodule MyList do
  def span(from, to) when to < from,
    do: raise(ArgumentError, "second argument must be greater than first")

  def span(from, from), do: [from]
  def span(from, to), do: [from | span(from + 1, to)]
end
