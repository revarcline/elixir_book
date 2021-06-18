# cycle
Stream.cycle(~w{ green white })
|> Stream.zip(1..5)
|> Enum.map(fn {class, value} -> "<tr class='#{class}'><td>#{value}</td></tr>\n" end)
|> IO.puts()

# repeatedly
Stream.repeatedly(fn -> true end) |> Enum.take(3)
Stream.repeatedly(&:random.uniform/0) |> Enum.take(3)

# iterate
Stream.iterate(0, &(&1 + 1)) |> Enum.take(5)
Stream.iterate(2, &(&1 * &1)) |> Enum.take(5)
Stream.iterate([], &[&1]) |> Enum.take(5)

# unfold
# fibbonacci example
Stream.unfold({0, 1}, fn {f1, f2} -> {f1, {f2, f1 + f2}} end) |> Enum.take(15)
