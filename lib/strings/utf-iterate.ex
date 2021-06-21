defmodule Utf8 do
  @moduledoc "learning about utf-8"
  def each(str, func) when is_binary(str), do: _each(str, func)

  defp _each(<<head::utf8, tail::binary>>, func) do
    func.(head)
    _each(tail, func)
  end

  defp _each(<<>>, _func), do: []
end

Utf8.each("∂og", fn char -> IO.puts(char) end)
