defmodule Chop do
  def guess(actual, a..b \\ 1..1000) when actual >= a and actual <= b do
    is_it(div(b, 2), actual, a..b)
  end

  def is_it(estimate, actual, a..b) when estimate === actual do
    IO.puts(estimate)
  end

  def is_it(estimate, actual, a..b) when estimate > actual do
    IO.puts("Is it #{estimate}")
    add = div(b - a, 2)
    b = estimate - 1
    is_it(a + add, actual, a..b)
  end

  def is_it(estimate, actual, a..b) when estimate < actual do
    IO.puts("Is it #{estimate}")
    sub = div(b - a, 2)
    a = estimate + 1
    is_it(b - add, actual, a..b)
  end
end
