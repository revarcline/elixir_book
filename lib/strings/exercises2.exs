defmodule MyString do
  def center(list) do
    columnize(list, get_widest(list, ""))
    |> Enum.each(&IO.puts(&1))
  end

  defp get_widest([], widest), do: String.length(widest)

  defp get_widest([head | tail], widest) do
    if String.length(head) > String.length(widest) do
      get_widest(tail, head)
    else
      get_widest(tail, widest)
    end
  end

  defp columnize([], _width), do: []

  defp columnize([head | tail], width) do
    if String.length(head) === width do
      [head | columnize(tail, width)]
    else
      spaces = div(width + String.length(head), 2)
      [String.pad_leading(head, spaces, " ") | columnize(tail, width)]
    end
  end

  # need the widest string
  # then need to add leading and trailing spaces to each item
  # no accumulator...
end

MyString.center(["My", "Big", "Stinky", "Feet", "Forever", "And", "Ever"])
