defmodule MyString do
  @moduledoc "capitalize sentences with a cute pipeline"
  def capitalize(string) do
    string
    |> String.split(".")
    |> Enum.drop(-1)
    |> Enum.map(&String.trim(&1))
    |> Enum.map(&String.capitalize(&1))
    |> Enum.join(". ")
    |> Kernel.<>(".")
  end
end
