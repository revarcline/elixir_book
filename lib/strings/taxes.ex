defmodule Taxes do
  @moduledoc "calculate state sales taxes"

  def all_orders(orders) do
    orders |> Enum.map(&apply_tax(&1))
  end

  defp apply_tax(order = [id: _, ship_to: state, net_amount: net]) do
    taxes = Keyword.get(tax_rates(), state, 0)
    tax = net * taxes
    total = net + tax
    Keyword.put(order, :total_amount, total)
  end

  defp tax_rates, do: [NC: 0.075, TX: 0.08]
end

defmodule FileProcessor do
  @moduledoc "processes csv files"
  def read(filename) do
    file = File.open!(filename)
    headers = read_headers(IO.read(file, :line))
    Enum.map(IO.stream(file), &create_one_row(headers, &1))
  end

  defp read_headers(header) do
    from_csv_and_map(header, &String.to_atom(&1))
  end

  defp from_csv_and_map(row, mapper) do
    row
    |> String.trim()
    |> String.split(~r{,\s*})
    |> Enum.map(mapper)
  end

  defp create_one_row(headers, row_csv) do
    row = from_csv_and_map(row_csv, &convert_numbers(&1))
    Enum.zip(headers, row)
  end

  defp convert_numbers(value) do
    cond do
      Regex.match?(~r{^\d+$}, value) -> String.to_integer(value)
      Regex.match?(~r{^\d+\.\d+$}, value) -> String.to_float(value)
      <<?:::utf8, name::binary>> = value -> String.to_atom(name)
      true -> value
    end
  end
end

# /home/arcline/code/pragmatic/elixir_book/string/
orders = FileProcessor.read("sales.csv")
IO.inspect(Taxes.all_orders(orders))
