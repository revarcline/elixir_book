defmodule DefaultParams1 do
  def func(p1, p2, \\ 123) do
    IO.inspect [p1, p2]
  end

  # this doesn't compile
  def func(p1, 99) do
    IO.puts "you said 99"
  end
end
