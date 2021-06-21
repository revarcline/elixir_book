defmodule MyString do
  def ascii?(chars), do: Enum.all?(chars, &(&1 in 32..126))

  def anagram?(word1, word2) do
    to_charlist(word1) |> Enum.sort() === to_charlist(word2) |> Enum.sort()
  end

  # first define charlist
  def calculate(expression) do
    {n1, rest} = parse_number(expression)
    rest = skip_spaces(rest)
    {op, rest} = parse_operator(rest)
    rest = skip_spaces(rest)
    {n2, []} = parse_number(rest)
    op.(n1, n2)
  end

  defp parse_number(expression), do: _parse_number({0, expression})

  defp _parse_number({value, [digit | tail]}) when digit in ?0..?9 do
    _parse_number({value * 10 + digit - ?0, tail})
  end

  defp _parse_number(result), do: result

  defp skip_spaces([?\s | tail]), do: skip_spaces(tail)
  defp skip_spaces(tail), do: tail

  defp parse_operator([?+ | tail]), do: {&(&1 + &2), tail}
  defp parse_operator([?- | tail]), do: {&(&1 - &2), tail}
  defp parse_operator([?* | tail]), do: {&(&1 * &2), tail}
  defp parse_operator([?/ | tail]), do: {&div(&1, &2), tail}
end
